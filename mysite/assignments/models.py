from django.db import models

# Create your models here.
class Assignment(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    learned_items = models.TextField()
    sprint = models.CharField(max_length=200)

    # string representation of the model
    def __str__(self):
        return self.title
