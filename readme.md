# Stylesheets engine for Refinery CMS.
This gem add capability to manage custom stylesheets to a Refinery CMS.

# Install
In your Gemfile

     gem refinerycms-stylesheets, git: 'git://github.com/sharespost/refinerycms-stylesheets.git'
     bundle
     rails g refinery:stylesheets
     rake db:migrate

# How to use
1. Log in to the CMS.
2. Add a new stylesheet.
3. Add this line to the top of your application controller

        helper Refinery::Stylesheets::Engine.helpers
4. And reference the custom stylesheets in your views or layout

        <%= css_for_refinery %>
