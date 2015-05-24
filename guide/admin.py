from django.contrib import admin
from .models import ReleaseNote, ReleaseVersion

class ReleasenoteInline(admin.StackedInline):
    model = ReleaseNote
    extra = 3


class ReleaseVersionAdmin(admin.ModelAdmin):
    list_display = ('version', 'time')
    fieldsets = [
        ('None', {'fields': ['version']}),
        ('Date information', {'fields': ['time'], 'classes': ['collapse']}),
    ]
    inlines = [ReleasenoteInline]

admin.site.register(ReleaseVersion, ReleaseVersionAdmin)
