# Rails Tutorial
A simple Rails app for a blog following this [tutorial](https://guides.rubyonrails.org/getting_started.html).

## Filtering
There are 2 types of filtering implemented on the Article model. The first is for exact matches on the title attribute. The second one will return all articles whose title starts with the provided prefix.
```
class Article < ApplicationRecord
  scope :title, -> (title) { where title: title }
  scope :starts_with, -> (title) { where("title like ?", "#{title}%") }
end
```

These filters are applied on the ArticlesController.
```
class ArticlesController < ApplicationController

  def index
    @articles = Article.where(nil) # creates an anonymous scope
    @articles = @articles.title(params[:title]) if params[:title].present?
    @articles = @articles.starts_with(params[:starts_with]) if params[:starts_with].present?
  end
  ...
end
```

To use the filters, pass them as query string parameters to the `/articles` route.
```
http://localhost:3000/articles?title=aaa
```
```
http://localhost:3000/articles?starts_with=a
```
