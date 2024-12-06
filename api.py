from flask import Flask, Blueprint, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from flask_jwt_extended import JWTManager, create_access_token, jwt_required, get_jwt_identity
from flasgger import Swagger

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///trello_clone.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECRET_KEY'] = 'your_secret_key'
app.config['JWT_SECRET_KEY'] = 'your_jwt_secret_key'

db = SQLAlchemy(app)
jwt = JWTManager(app)
swagger = Swagger(app)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100), unique=True, nullable=False)
    password = db.Column(db.String(100), nullable=False)

    def to_dict(self):
        return {'id': self.id, 'username': self.username}


class Board(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)

    def to_dict(self):
        return {'id': self.id, 'name': self.name, 'user_id': self.user_id}


@app.before_first_request
def create_tables():
    db.create_all()


# API Blueprint
api = Blueprint('api', __name__, url_prefix='/api')


@api.route('/login', methods=['POST'])
def login():
    """
    User login to get access token
    ---
    parameters:
      - in: body
        name: body
        required: true
        schema:
          type: object
          properties:
            username:
              type: string
              example: user1
            password:
              type: string
              example: password123
    responses:
      200:
        description: Access token created successfully
        schema:
          type: object
          properties:
            access_token:
              type: string
              example: <JWT Token>
      401:
        description: Invalid credentials
    """
    data = request.get_json()
    username = data.get('username')
    password = data.get('password')

    user = User.query.filter_by(username=username).first()
    if user and user.password == password:
        access_token = create_access_token(identity=user.id)
        return jsonify(access_token=access_token), 200

    return jsonify(message="Invalid credentials"), 401


@api.route('/protected', methods=['GET'])
@jwt_required()
def protected():
    """
    Protected route to test JWT authentication
    ---
    responses:
      200:
        description: Logged in successfully
        schema:
          type: object
          properties:
            logged_in_as:
              type: string
              example: user1
    """
    current_user_id = get_jwt_identity()
    user = User.query.get(current_user_id)
    return jsonify(logged_in_as=user.username), 200


@api.route('/boards', methods=['POST'])
@jwt_required()
def create_board():
    """
    Create a new board
    ---
    parameters:
      - in: body
        name: body
        required: true
        schema:
          type: object
          properties:
            name:
              type: string
              example: "My New Board"
    responses:
      201:
        description: Board created successfully
        schema:
          type: object
          properties:
            id:
              type: integer
              example: 1
            name:
              type: string
              example: "My New Board"
            user_id:
              type: integer
              example: 1
      400:
        description: Board name is required
    """
    data = request.get_json()
    name = data.get('name')

    if not name:
        return jsonify(message="Board name is required"), 400

    current_user_id = get_jwt_identity()
    board = Board(name=name, user_id=current_user_id)
    db.session.add(board)
    db.session.commit()

    return jsonify(board.to_dict()), 201


@api.route('/boards', methods=['GET'])
@jwt_required()
def get_boards():
    """
    Get all boards for the current user
    ---
    responses:
      200:
        description: List of boards
        schema:
          type: array
          items:
            type: object
            properties:
              id:
                type: integer
                example: 1
              name:
                type: string
                example: "My Board"
              user_id:
                type: integer
                example: 1
    """
    current_user_id = get_jwt_identity()
    boards = Board.query.filter_by(user_id=current_user_id).all()
    return jsonify([board.to_dict() for board in boards]), 200


app.register_blueprint(api)

if __name__ == '__main__':
    app.run(debug=True)
