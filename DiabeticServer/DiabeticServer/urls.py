from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.urls import path,include,re_path

urlpatterns = [
    path("ai/", include("MainApp.urls")),
    path('admin/', admin.site.urls),
]

urlpatterns += static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root = settings.STATIC_ROOT)