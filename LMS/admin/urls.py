from django.contrib import admin
from django.urls import path,include
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.conf import settings
from django.contrib.auth import logout
from django.conf.urls import url
from . import views

app_name='Admin'

urlpatterns = [
    path('',views.admin_dashboard,name="admin_dashboard"),
    path('admin_dashboard',views.admin_dashboard,name="admin_dashboard"),
    # path('admin_dashboard',views.admin_dashboard,name="admin_dashboard"),
    path("log_out",views.log_out,name="log_out"),
    path('admin_profile',views.admin_profile,name="admin_profile"),
    path('admin_users',views.admin_users,name="admin_users"),
    path('admin_transactions',views.admin_transactions,name="admin_transactions"),
    path('admin_books',views.admin_books,name="admin_books"),
    path('update_profile',views.update_profile,name="update_profile"),
    # path('admin_departments',views.admin_departments,name="admin_departments"),
    url(r'^delete_user/(?P<id>[0-9]+)/$',views.delete_user,name="delete_user"),
    url(r'^delete_book/(?P<id>[0-9]+)/$',views.delete_book,name="delete_book"),
    url(r'^delete_transaction/(?P<id>[0-9]+)/$',views.delete_transaction,name="delete_transaction"),
    path ('request_admin',views.request_admin,name="request_admin"),
    path('add_book',views.add_book,name="add_book"),
]