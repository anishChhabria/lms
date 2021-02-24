from django.contrib import admin
from django.urls import path,include
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.conf import settings
from django.contrib.auth import logout
from django.conf.urls import url
from . import views

app_name='Midadmin'

urlpatterns = [
    path('',views.midadmin_dashboard,name="midadmin_dashboard"),
    path('midadmin_dashboard',views.midadmin_dashboard,name="midadmin_dashboard"),
    # path('admin_dashboard',views.admin_dashboard,name="admin_dashboard"),
    path("log_out",views.log_out,name="log_out"),
    path('midadmin_profile',views.midadmin_profile,name="midadmin_profile"),
    # path('midadmin_users',views.midadmin_users,name="admin_users"),
    # path('midadmin_transactions',views.midadmin_transactions,name="admin_transactions"),
    path('midadmin_books',views.midadmin_books,name="midadmin_books"),
    path('update_profile',views.update_profile,name="update_profile"),
    # path('admin_departments',views.admin_departments,name="admin_departments"),
    path ('book_request',views.book_request,name="book_request"),
    url(r'^delete_user/(?P<id>[0-9]+)/$',views.delete_user,name="delete_user"),
    url(r'^delete_book/(?P<id>[0-9]+)/$',views.delete_book,name="delete_book"),
    url(r'^delete_transaction/(?P<id>[0-9]+)/$',views.delete_transaction,name="delete_transaction"),
]