from unittest.util import _MAX_LENGTH
from django.db import models

class userTrack(models.Model):
    name = models.CharField(max_length = 50)
    track_id = models.CharField(max_length = 50)

    def __str__(self):
        return self.name + ' ' + self.track_id


