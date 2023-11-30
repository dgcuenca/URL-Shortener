# URL Shortener

## Requirements

* Submit a url in a form on the homepage
* URL is saved to the databes
* The URL can be viewed by accessing a Base62 encoded primary key ID (short code) of the URL at v/:id
* A user should be able to copy the short URL to the clipboard
* When visiting the short code, a view is recorded so we can keep track of how many view per day a URL gets
* A total number of views should be saved to the URL record
* A user should be able to view a graph of the views over the past 2 weeks
* A user should be able to edit and delete a URL
* We should also retrieve the tittle, description and opengraph image for the HTML document
  * This should run in the background to keep the application fast
  * If a URL is edited, we should update the title, description and image for it
* We should paginate the list of shortened URLs