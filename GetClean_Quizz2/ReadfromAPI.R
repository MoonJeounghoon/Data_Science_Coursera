# Load useful packages
install.packages("httr")
library(httr)
install.packages("httpuv")
library(httpuv)
install.packages("jsonlite")
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.

myapp <- oauth_app("github", "6f0245a369696ae4ff07", "ff97a146c3301d181a4c64fbbf68dded551f6bcf")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

# Read file
json1=content(req)
json2 = jsonlite::fromJSON(toJSON(json1))

# Find the time that the datasharing repo was created
json2$created_at[json2$name == "datasharing"]

#Answer: "2013-11-07T13:25:07Z"
