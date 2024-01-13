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



auth=Blueprint('auth',__name__)

# Function used to direct user to the login page name value is used to input
@auth.route('/login',methods=['GET','POST'])
def login():
  
    if request.method == 'POST':
        UserId=request.form.get('Email')
        entered_password=request.form.get('password')
        
        user=Users.query.filter_by(userid=UserId).first()
        if user :
            if check_password_hash(user.password,entered_password):
                
                flash("Logged in successfully",category='success')
                login_user(user,remember=True)
                return redirect(url_for('pages.Dashboard'))
            else:
                return render_template('Login.html',error="Wrong password !")
        elif UserId == params['UserId'] and entered_password == params['admin_password']:
            return redirect(url_for('pages.AdminDashboard',user=current_user))
        else:
            return render_template('Login.html',error="User not found contact admin !")
    else: 
        return render_template('Login.html')
    

# Function used to direct user to the homepage after a logout
@auth.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('homepage'))

@auth.route('/change-admin-password',methods=['GET','POST'])
def changeAdminpassword():
    pass



# Function to change password for normal user

@auth.route('/change-password',methods=['GET','POST'])
@login_required
def change_password():
    if current_user:
        if request.method == 'POST':
            UserId=request.form.get('email')
            oldpassword=request.form.get('old_passwrod')
            newpassword=request.form.get('new_passowrd')
            confirm_password=request.form.get('confirm_password')

            user=Users.query.filter_by(email=session['user']).first()
            if  check_password_hash(user.password,oldpassword):
                    if len(newpassword)<8:
                        return render_template('Password must have a minimum of 8 character.')
                    elif newpassword != confirm_password:
                        return render_template('changepassword.html',error="passwords Does not match")
                    else:
                        new_passowrd_hash=generate_password_hash(newpassword,method='pbkdf2:sha256')
            
            else:
                return render_template('changepassword.html',error="Passwords do not match!")
    else: 
        return render_template('changepassword.html')
    


# Function used to add members, it checks for all requesties of the member and submits the request based on 
# the condition and user action.
@auth.route('/signup',methods=['GET','POST'])

def AddMember():
    if request.method == 'POST':
        fullname=request.form.get('fullname')
        uemail=request.form.get('email')
        upassword=request.form.get('password')
        confirm_password=request.form.get('confirm_password')

        user=Users.query.filter_by(userid=uemail).first()
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
            user=Users(name=fullname,userid=uemail,password=generate_password_hash(upassword,method='pbkdf2:sha256'))
            db.session.add(user)
            db.session.commit()
            flash('Member added!!',category='success')

        return redirect(url_for('pages.AdminDashboard'))
    
    else:
        return render_template('AddMember.html')



@auth.route('/delete_user')
@login_required
def DeleteMember():
    pass

@auth.route('/edit_user')
@login_required
def EditMember():
    pass


