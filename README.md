# bonz-collection-exhibition

## Abstract
Full-stack web application

Built a backend with basic Servlet/tomcat package

Construct static web resources with basic HTML/CSS 
and some Bootstrap to beautify it

## controller (web, servlet)
Classify the controllers with same properties 
(i.e. request same subdomain but with different purpose)
into one controller which extends the BaseContext class 
in which it used reflection to implement the integration

Therefore, reduce a lot of duplicated codes and unnecessary controller class

## service
Implement the service logic in this layer with the help of mapper function
which may import other service classes and mapper classes to complete some complex requests

## mapper (dao)
Implement basic query and complex dynamic query 
by using JDBC library

## JQuery
Employed Ajax to transfer data between frontend and backend

Utilized "$()" to control html element so that carry out the function of dynamically refreshing web page 
(but with lower efficiency compare to using VDOM (diff algorithm) to update page (Vue and React adopt this technology)).

## Project display

### front page
![front page](https://github-zen-project.s3.amazonaws.com/collection-images/front+page.jpeg "front page")

### login
![login](https://github-zen-project.s3.amazonaws.com/collection-images/login+page.jpeg "login")

### sign up
![sign up](https://github-zen-project.s3.amazonaws.com/collection-images/sign+up.jpeg "sign up")

### collection exhibition
![collection exhibtion](https://github-zen-project.s3.amazonaws.com/collection-images/collection+exibition.jpeg "collection exhibition")

### collection detail
![collection detail](https://github-zen-project.s3.amazonaws.com/collection-images/collection+detail+page.jpeg "collection detail")

### ranking
![ranking](https://github-zen-project.s3.amazonaws.com/collection-images/ranking+page.jpeg "ranking")
