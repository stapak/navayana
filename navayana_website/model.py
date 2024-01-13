"""
This file conatains the DataBase Management  of the webserver.
This file deals with the information of the users  and their articles it connects articles with the authors information.

"""

from . import db
from flask_login import UserMixin
from sqlalchemy.sql import func



class Articles(db.Model):
    articleid=db.Column(db.Integer,primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    description = db.Column(db.String(80), nullable=False)
    content= db.Column(db.Text,  nullable=False)
    author = db.Column(db.String(20), nullable=False)
    date_posted = db.Column(db.DateTime, nullable=True)
    Last_updated= db.Column(db.DateTime,nullable=False)
    author_email = db.Column(db.String(80), db.ForeignKey('users.email'))
    


class Users(db.Model,UserMixin):
    name=db.Column(db.String(50),nullable=False)
    email=db.Column(db.String(50),primary_key=True)
    password=db.Column(db.String(1000),nullable=False)
    articles=db.relationship('Articles')

