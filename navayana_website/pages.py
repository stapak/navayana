"""
This file contains all the routes for pages   such as homepage,Locate us,team, articlespage
authentication parts such as login logut are avoided in this file

this file us only used for maintainance of the webpages.

"""
from flask import Blueprint,render_template, request, redirect, url_for, session,flash
from .model import Articles,Users
from . import params,db
from datetime import datetime
from sqlalchemy.sql import func
pages=Blueprint('pages',__name__)
from flask_login import login_required,current_user





""" These fucntion control the home page and other pages for normal users."""

# this fuction organises the home page
@pages.route('/')
def homepage():
    latest_entries = Articles.query.order_by(Articles.articleid.desc()).limit(4).all()
    article_list=len(latest_entries)
    return render_template('Homepage.html',latest_entries=latest_entries,no=article_list)

# this funciton maintains locate us page.
@pages.route('/aritclespage')
def aritclespage():
    articles=Articles.query.filter_by().all()
    return render_template('ArticlesPage.html',articles=articles)

# this funciton maintains team page
@pages.route('/team')
def team():
    return render_template('Team.html')

# this funciton maintains locate us page
@pages.route('/LocateUs')
def LocateUs():
    return render_template('LocateUs.html')

# this funciton used for testing.
@pages.route('/test')
def testing():
    return render_template("AddAuthor.html")

# Redirects user to the Read article page based on 'article id'
@pages.route('/readarticles/<int:article_id>',methods=['GET'])
def readarticles(article_id):
    article=Articles.query.filter_by(articleid=article_id).first()
    return render_template('ReadArticle.html',article=article)




""" 
These fucntion control the dashboard page and other pages for navayana firm members. These are prevented from nomal 
website users visit.

"""
@pages.route('/admindashboard')
def AdminDashboard():
    if ('user' in session and session["user"] == params["UserId"]):
        articles=Articles.query.filter_by().all()
        users=Users.query.filter_by().all()
        return render_template('AdminPage.html',articles=articles,users=users)
    else:
        return redirect(url_for('pages.homepage'))

@pages.route('/dashboard')
@login_required
def Dashboard():
        return render_template('UserDashboard.html',user=current_user)


# This method id used to upload articles to the data base with add the neccessary requirements 
@pages.route('/addarticle',methods=['GET','POST'])
@login_required
def addarticle():
        user=current_user
        if request.method=='POST':
            Title=request.form.get('title')
            Description=request.form.get('description')
            Content_uploaded=request.form.get('content')
            
            now = datetime.now()
            formatted_date = now.strftime("%Y-%m-%d %H:%M:%S")
            authorid=current_user.id
            Name=user.name
            article=Articles(title=Title,description=Description,content=Content_uploaded,Last_updated=formatted_date,date_posted=formatted_date,author=Name,author_id=authorid)
            
            db.session.add(article)
            db.session.commit()
            flash('Article Uploaded successfully !!',category='success')
            return redirect(url_for('pages.Dashboard'))
        else:
            return render_template('AddArticle.html')

@pages.route('/EditArticle/<int:articleid>',methods=['GET','POST'])
@login_required
def EditArticle(articleid):
    user=current_user
    article_to_edit=Articles.query.filter_by(articleid=articleid).first()
    if article_to_edit.author_id == user.id :
        if request.method=="POST":
            Title=request.form.get('title')
            Description=request.form.get('description')
            content_edited=request.form.get('content') 
            now = datetime.now()
            formatted_date = now.strftime("%Y-%m-%d %H:%M:%S")

            article_to_edit.title=Title
            article_to_edit.description=Description
            article_to_edit.content=content_edited
            article_to_edit.Last_updated=formatted_date
                
            db.session.commit()
            flash('Aritcle updated success fully',category='success')
            return redirect(url_for('pages.Dashboard'))
            
        else:
            return render_template('EditArticles.html',article=article_to_edit)
    else:
        flash('You are no author of the article, You cannot edit the post')
        return render_template(url_for('pages.Dashboard'))



@pages.route('/DeleteArticle/<int:articleid>')
@login_required
def DeleteArticle(articleid):
    article=Articles.query.filter_by(articleid=articleid).first()
    if article.author_id == current_user.id:  
        db.session.delete(article)
        db.session.commit()
        flash("Article  Deleted Successfully",category='sucess')
        return redirect(url_for('pages.Dashboard'))
    else:
        flash("Article Not Deleted !!!  You are not the auhtor of the article",category='error')
        return redirect(url_for('pages.Dashboard'))
        

@pages.route('/AdminDeleteArticle/<int:articleid>')
def AdminDeleteArticle(articleid):
    if ('user' in session and session["user"] == params["UserId"]):
        article=Articles.query.filter_by(articleid=articleid).first()
        db.session.delete(article)
        db.session.commit()
        flash('Article Deleted Successfully !!',category='success')
        return redirect(url_for('pages.AdminDashboard'))
    else:
        return render_template('pages.homepage')
    






