from flask import Flask, request, Response
from flask_restful import Resource, Api, reqparse, abort, fields, marshal_with

from flask_mongoengine import MongoEngine

app = Flask(__name__)
api = Api(app)

app.config['MONGODB_SETTINGS'] = {
    "db" : "credentials_model",
    "host" : "local",
    "port" : 5000,
}

db = MongoEngine()
db.init_app(app)

credentials = {
    1 : {"username" : "David", "password" : "123456"}
}

class CredentialModel(db.Document):
    _userID = db.IntField(required = True)
    username = db.StringField(required = True)
    password = db.StringField(required = True)

resource_fields = {
    "_userID" : fields.Integer,
    "username" : fields.String,
    "password" : fields.String,
}

class Credential(Resource):
    @marshal_with(resource_fields)
    def get(self, userID, username, password):
        user = CredentialModel.objects.get(_userID=userID)
        if not (user.username == username and user.password == password):
            abort(404, message="Username not found")
        return True
    
    @marshal_with(resource_fields)
    def post(self, username, password):
        credential = CredentialModel(username = username, password = password).save()
        return True
    


if __name__ == "__main__":
    app.run(debug=True)