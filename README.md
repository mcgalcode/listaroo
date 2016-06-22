# Listaroo Header Documentation

To make API requests to Listaroo resources (teams and lists), you must supply two additional headers in all HTTP requests:

```
useridaroo: idOfLoggedInuser
autharoo-token: apiTokenReturnedByLoginRequest
```

## Lists

Each of the following endpoints returns either an array of list objects (for the Index endpoint) or a single list objects. List objects have the following parameters:

* title
* id
* child_lists (an array of child lists, note that these children do NOT include their own children)

### Index (get all lists for a team)

```
Method: GET
Url: /api/lists.json?teamId=XXX (XXX is the id of the team whose list you want)
```

### Destroy

```
Method: DELETE
Url: /api/lists/:list_id (where :list_id is the id of the list you want to delete)
```

### Create

```
Method: POST
Url: /api/lists
Data:
  {
    "title" : yourListTitle,
    "teamId" : teamId,
    "parentListId" : parentListId    
  }
```

**NOTE:** If you want to add a top level list to a team (list without a parent), pass a parentListId of 0.
### Update

```
Method: PUT
Url: /api/lists/:list_id (where :list_id is the id of the list to update)
Data:
  {
      'title': yourListTitle
  }
```

### Show (get a particular list)

```
Method: GET
Url: /api/lists/:list_id (where :list_id is the id of the desired list)
```
## Sessions

### Create (login)*

```
Method: POST
Url: /api/login
Data:
  {
    'username' : yourUserName,
    'password' : yourPassword
  }
```
Returns a user object with the following params:

* id
* first_name
* last_name
* username
* email
* api_token

### Destroy (logout)

```
Method: DELETE
Url: /api/:user_id/logout (where :user_id is the id you are logging out from)
```

Returns nothing.

## Users

### Create (Sign up)

```
Method: POST
Url: /api/signup
Data:
  {
    "username" : "blahblahblah",
    "password" : "blahblahblah",
    "password_confirmation" : "blahblahblah",
    "first_name" : "blahblahblah",
    "last_name" : "blahblahblah",
    "email" : "blahblahblah"
  }
```
Returns a user object with the following properties:

* id
* first_name
* last_name
* username
* email
* api_token

**NOTE:** If some of these properties are null on return, its because the server side has not been fully implemented yet, probably not your fault. (you should definitely get username, id and api_token tho)

## Teams

Some of the following methods return a json rendering of a team object with the following properties:

* name
* id
* creator - a subobject with a .username property (i.e. response.data.creator.username)
* invited_users - an array of subobjects, each with a .username property (i.e. response.data.invited_users[3].username)

### Index

```
Method: POST
Url: /api/teams?userId=XXX&type=YYY
  where:
      userId is the name of the user
      type: either "created" or "invited"
```

Returns either the teams the users have *created* or *invited* depending on the type parameter past in through the URL query string (team object in response has same structure described above)

### Show

```
Method: GET
Url: /api/teams/:team_id (where :team_id is the id of the team you wish to retrieve)
```

Returns a team object.

### Create

```
Method: POST
Url: /api/teams
Data:
  {
    'name' : yourNewTeamName,
    'creatorId' : the id of the user who created the team
  }
```

Returns a team object.

### Destroy

```
Method: DELETE
Url: /api/teams/:team_id (where :team_id is the id of the team you want to delete)
```

Returns nothing.

### Update

```
Method: PUT
Url: /api/teams/:team_id
Data:
  {
    'name' : revisedTeamName
  }
```

Returns updated team object

### Invite User

```
Method: POST
Url: /api/teams/:team_id/invite (where :team_id is the id of the team you are inviting the user to)
data:
  {
    'username' : theUsernameOfTheInvitedUser
  }
```

Returns the users username if successfully added.
