from django.shortcuts import render

posts = [
    {
        "author": "MistaT",
        "title": "Blog Post 1",
        "content": "Jimmy crack corn",
        "date_posted": "August 27th 2001",
    },
    {
        "author": "GainT",
        "title": "Blog Post 2",
        "content": "Jimmy fucks corn",
        "date_posted": "August 28th 2001",
    },
]


# Create your views here.
def home(request):
    context = {"posts": posts}
    return render(request, "blog/home.html", context)


def about(request):
    return render(request, "blog/about.html", {"title": "About"})
