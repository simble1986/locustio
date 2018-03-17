# locustio
A docker image for locust

## Links

* Docker: <a href="https://hub.docker.com/r/simble1986/locustio/">simble1986/locustio</a>
> docker pull simble1986/locustio
* Locust: <a href="https://www.locust.io/">locust</a>

## Description

This project is an autumated build of locustio for docker.

## How to Use

* Re-build the image

Create locustfile.py according to the locust document <a href="https://docs.locust.io/en/latest/quickstart.html">Document</a>

``` python
from locust import HttpLocust, TaskSet

def login(l):
    l.client.post("/login", {"username":"ellen_key", "password":"education"})

def index(l):
    l.client.get("/")

def profile(l):
    l.client.get("/profile")

class UserBehavior(TaskSet):
    tasks = {index: 2, profile: 1}

    def on_start(self):
        login(self)

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 5000
    max_wait = 9000

```

Build your own image

> docker build -t mylocustio .

* Run docker

> docker run -d --rm -e PARAMS="-f docker.py  -c 10000 -r 500  --host http://testsite" mylocustio
