"""
This file contains all the information of authorization process and major backend logic of the website.
It contains all the information of the login, page , created 

"""



from flask import Blueprint,render_template, request, redirect, url_for, session, flash
from .model import Users
from . import params,db
from . import pages
from werkzeug.security import generate_password_hash,check_password_hash
from flask_login import login_user,logout_user,current_user,login_required
import json




auth=Blueprint('auth',__name__)

# Function used to direct user to the login page name value is used to input
@auth.route('/login',methods=['GET','POST'])
def login():
    if 'user' in session:
        return redirect(url_for('pages.AdminDashboard'))
    
        
    elif request.method == 'POST':
        UserId=request.form.get('Email')
        entered_password=request.form.get('password')
        
        user=Users.query.filter_by(email=UserId).first()
        if user :
            if check_password_hash(user.password,entered_password):
                
                flash("Logged in successfully",category='success')
                login_user(user,remember=True)
                return redirect(url_for('pages.Dashboard'))
            else:
                return render_template('Login.html',error="Wrong password !")
        elif UserId == params['UserId'] :
            if check_password_hash(params['admin_password'],entered_password):
                session['user']=UserId
                return redirect(url_for('pages.AdminDashboard'))
            else:
                return render_template('Login.html',error="Admin Passowrd Does not match !")
        else:
            return render_template('Login.html',error="User not found contact admin !")
    else: 
        return render_template('Login.html')
    

# Function used to direct user to the homepage after a logout
@auth.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('pages.homepage'))

@auth.route('/Adminlogout')
def Adminlogout():
    if ('user' in session and session["user"] == params["UserId"]):
        session.pop('user')
        return redirect(url_for('pages.homepage'))
    else:
        return redirect(url_for('pages.home'))

@auth.route('/change-admin-password',methods=['GET','POST'])
def changeAdminpassword():
    if ('user' in session and session["user"] == params["UserId"]):
        if request.method == 'POST':
            oldpassword=request.form.get ('old_password')
            newpassword=request.form.get('new_password')
            confirm_password=request.form.get('confirm_password')

            if  check_password_hash(params['admin_password'],oldpassword):
                if len(newpassword)<8:
                    return render_template('AdminPasswordC.html',error='Password must have a minimum of 8 character.')
                elif newpassword != confirm_password:
                    return render_template('AdminPasswordC.html',error="Passwords don't match")
                else:
                    new_passowrd_hash=generate_password_hash(newpassword,method='pbkdf2:sha256')
                    params['admin_password']=new_passowrd_hash
                    
                    flash("password changed successfully!",category="success")
                    return redirect(url_for('pages.AdminDashboard'))
            else:
                return render_template('AdminPasswordC.html',error="Wrong Password!")

        else:
            return render_template('AdminPasswordC.html')
        
    else:
        return redirect(url_for('pages.homepage'))



# Function to change password for normal user

@auth.route('/changepassword',methods=['GET','POST'])
@login_required
def change_password():
    if request.method == 'POST':
        oldpassword=request.form.get ('old_password')
        newpassword=request.form.get('new_password')
        confirm_password=request.form.get('confirm_password')

        user=current_user
        if  check_password_hash(user.password,oldpassword):
            if len(newpassword)<8:
                return render_template('changepassword.html',error='Password must have a minimum of 8 character.')
            elif newpassword != confirm_password:
                return render_template('changepassword.html',error="Passwords don't match")
            else:
                new_passowrd_hash=generate_password_hash(newpassword,method='pbkdf2:sha256')
                user.password=new_passowrd_hash
                db.session.commit()
                flash("password changed successfully!",category="success")
                return redirect(url_for('pages.Dashboard'))
        else:
            return render_template('changepassword.html',error="Wrong Password!")

    else:
        return render_template('changepassword.html')

    


# Function used to add members, it checks for all requesties of the member and submits the request based on 
# the condition and user action.
@auth.route('/AddAuthor',methods=['GET','POST'])
def AddAuthor():
    if ('user' in session and session["user"] == params["UserId"]):
        if request.method == 'POST':
            fullname=request.form.get('fullname')
            uemail=request.form.get('email')
            upassword=request.form.get('password')
            confirm_password=request.form.get('confirm_password')

            user=Users.query.filter_by(email=uemail).first()
            if user:
                flash('Email Already registered !',category='error')
            elif len(fullname) <= 5:
                flash('Full Name must be greate than 5 letters',category='error')
            elif len(uemail) <= 8:
                flash('Enter proper Email',category='error')
            elif len(upassword)< 8:
                flash('Password must be at least 8 letters',category='error')
            elif upassword !=confirm_password:
                flash('Password does not match',category='error')
            else:
                user=Users(name=fullname,email=uemail,password=generate_password_hash(upassword,method='pbkdf2:sha256'))
                db.session.add(user)
                db.session.commit()
                flash('Member added!!',category='success')
            return redirect(url_for('pages.AdminDashboard'))
    
        else:
            return render_template('AddAuthor.html')
    else:
        return redirect(url_for('pages.home'))



@auth.route('/DeleteAuthor/<int:author_id>')
def DeleteAuhtor(author_id):
    if ('user' in session and session["user"] == params["UserId"]):
        user=Users.query.filter_by(id=author_id).first()
        db.session.delete(user)
        db.session.commit()
        flash('User Deleted Successfully !!',category='success')
        return redirect(url_for('pages.AdminDashboard'))
    else:
        return render_template('pages.homepage')
        

@auth.route('/EditAuthor',methods=['GET','POST'])
def EditAuthor():
    if ('user' in session and session["user"] == params["UserId"]):
        if request.method == 'POST':
            uemail=request.form.get('email')
            user1=Users.query.filter_by(email=uemail).first()
            if user1:
                newpassword=request.form.get('new_password')
                confirm_password=request.form.get('confirm_password')

                user=user1
                if len(newpassword)<8:
                    return render_template('Password must have a minimum of 8 character.')
                elif newpassword != confirm_password:
                    return render_template('EditAuthor.html',error="Passwords don't match")
                else:
                    new_passowrd_hash=generate_password_hash(newpassword,method='pbkdf2:sha256')
                    user.password=new_passowrd_hash
                    db.session.commit()
                    flash("password changed successfully!",category="success")
                    return redirect(url_for('pages.AdminDashboard'))
            else:
                return render_template('EditAuthor.html',error="No author with that email")
        else:
            return render_template('EditAuthor.html')
    else:
        flash("Invalid request found",category="error")
        return redirect(url_for('pages.AdminDashboard'))


