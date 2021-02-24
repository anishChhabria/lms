from django.contrib import admin
from django.urls import include,path
from django.conf.urls import url
from . import views

urlpatterns=[
    path('',views.index,name="index"),
    #path('12345',views.test,name="test"),
    path('checkout',views.checkout,name="checkout"),
    path('signin',views.signin,name="signin"),
    path('search_by_filter',views.search_by_filter,name="search_by_filter"),
    path('forgot_password',views.forgot_password,name="forgot_password"),
    path('signup',views.signup,name="signup"),
    path('login',views.render_login,name="login"),
    path('login_check',views.login,name="login_check"),
    path('dashboard',views.dashboard,name="dashboard"),
    path('contact_us',views.contact,name="contact_us"),
    path('explore',views.explore,name="explore"),
    path('search_by_search_bar',views.search_by_search_bar,name="search_by_search_bar"),
    path('history',views.history,name='history'),
    path('profile',views.user_profile,name="profile"),
    path('update_profile',views.update_profile,name="update_profile"),
    path('payment_portal',views.payment_portal,name="payment_portal"),
    path('log_out',views.log_out,name="log_out"),
    #path('product_list',views.product_list,name="product_list"),
    url(r'^add_elements_to_cart/(?P<pid>[0-9]+)/(?P<click>[0-1]+)/$',views.add_elements,name="add_elements_to_cart"),
    url(r'^delete_element/(?P<pid>[0-9]+)/$',views.delete_element,name="delete_element"),
    path('delete_all_items',views.delete_all_items,name="delete_all_items"),
    path('carousal',views.carousal,name="carousal"),
    url(r'^commit_transaction/(?P<choice_id>[0-3]+)/$',views.commit_transaction,name="commit_transaction"),
    url(r'^filter_history/(?P<choice_id>[0-9]+)/$',views.history_filter,name="filter_history"),
    url(r'^individual_book/(?P<book_id>[0-9999]+)/$',views.individual_book,name="individual_book")
]