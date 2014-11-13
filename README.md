# ShareCare: 
### a team-based web app for sharing caretaking duties
==============

###Project Overview
ShareCare is Rails based, and was built as part of the accelerated learning program at MakerSquare.

Which means that, though I'd love for this to be an actual product, it was build largely as a learning process. It would also be called "project management for dogs" if that didn't make it sound like the dogs were doing the management.
___
### Project Inspiration
My girlfriend and I have both a dog AND busy schedules that don't always overlap. Sometimes, I'll come home from work and not be sure whether the dog needs to be walked or fed because my girlfriend forgot to leave a note. (Honestly, it happens just as frequently the other way around.) It's not a great shame if we walk her or feed her twice; but what if I'm not sure if she's had her medicine?

And what if we're talking not about our dog, but about a baby or about an elderly parent that needs to be cared for?

This was my inspiration for ShareCare, a web app I designed to be easy to use so that you could walk the dog (or rock a baby) with one hand and click "Task Complete!" on your phone with the other.
___
###Tech Stack
Built with:

1. Rails (for routing)
2. Ruby (for logic)
3. ActiveRecord/SQLite (for database persistence)
4. Devise (for user authentication)
5. Foundation (for display)
6. JavaScript and jQuery (for DOM manipulation and responsive display)

I also developed ShareCare using transaction scripts and plenty of AJAX calls to make the site faster, easier to use, and more secure.
___
###Learning goals

1. Gain greater mastery of Rails routing and RESTful architecture.
2. Practice CRUD methods for database models.
3. Develop a complex database and figure out how to minimize database calls.
4. Implement Rails-based AJAX calls and DOM manipulations with partials.
5. Create transaction scripts to minimize logic in the controller
6. Refactor for efficiency and readable/maintainable code.

___
### Minimum Viable Product User Stories

A User can
* Sign up and sign in securely
* Create a team focused on caring for one person / dog / project
* Invite other users to join that team
* Accept or reject invitations to teams
* Leave a team
* Delete a team that they are in charge of
* See all the tasks for a team that they belong to
* Create tasks for that team
* Claim tasks, mark tasks as complete, and delete tasks for that team

___
### Pain Points

* Getting up to speed on Foundation, getting Foundation and Rails to work together
* Designing the database and the database calls for most efficiency
* Working out DateTime picker gem and DateTime / Time zone issues

___

### Extended Features

A User can
* Leave a team that they are in charge of and pass on "primary" status to the next team member
* Be informed if they are the last member of that team--and be asked to delete rather than leave
* See tasks split into different categories (claimed, overdue, active, completed)
* Avoid getting multiple invitations for the same team
* Get SweetAlerts rather than boring normal alerts

___

### Future Additions

* Create settings page where user can set variables that will be remembered for each visit: time zone, style of alert, length before auto-close of alert
* Set up emailer, possibly SMS text alert system
* Set up repeating tasks
* Set up calendar view
* Responsive and mobile design
