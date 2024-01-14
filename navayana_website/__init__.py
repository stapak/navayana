"""

This file converts any folder into python package.
This file is initialized when server starts.

"""



from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import json
from flask_login import LoginManager

db=SQLAlchemy()
#current_dir = os.path.dirname('__init__.py')
#json_file_path = os.path.join(current_dir, 'credentials.json')

with open(r'C:\Users\HP\Desktop\website\navayana_website\credentials.json','r') as c:
    params=json.load(c)["params"]
    

local_server=params['local_server']
def webserver():
    app=Flask(__name__)
    app.config['SECRET_KEY']=params['secret_key']
    app.secret_key=params['session_secret_key']
    if local_server:
        app.config['SQLALCHEMY_DATABASE_URI']= params['local_uri']
    else:
        app.config['SQLALCHEMY_DATABASE_URI']= params['prod_uri']
   
    db.init_app(app)

    from .auth import auth
    from .pages import pages
    app.register_blueprint(pages,url_prefix='/')
    app.register_blueprint(auth,url_prefix='/')

    login_manager=LoginManager()
    login_manager.login_view='auth.login'
    login_manager.init_app(app)

    from .model import Users

    @login_manager.user_loader
    def load_user(id):
        return Users.query.get(id)

    return app

def UserTest():
    from .model import Users
    return Users
