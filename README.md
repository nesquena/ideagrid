IdeaGrid
==========

We believe there's no problem too big for the human spirit.  No matter how monumental a problem is, it can be compartmentalized and solved by people with the passion to make a real difference.

Note: This project is a work in progress to showcase the power of Padrino.

Overview
-------------

I would like to build this out slowly but surely. Basically this will be a port of the existing (but incomplete) website at [IdeaGrid](http://ideagrid.org). The basic structure is as follows:

* Users can post problems that exist in the world, no matter how big or small.
* For each problem, users can propose ideas to solve the problem.
* Other users can upvote good ideas and when an idea receive enough votes, it will become a project.
* For each project, users can add actionable tasks to help work towards the project.
* For each task, users can set parameters such as "frequency", "people needed", "type".
* Users can then commit to completing a task and help contribute towards the project's completion

Checkout [IdeaGrid](http://ideagrid.org) for an incomplete execution of this idea. I want to port the existing functionality (creating problems, projects and tasks) over to this new application.

Description
-----------

Ideagrid is a site designed to help people efficiently solve problems big (i.e climate change, water shortage) and small (i.e an accident prone traffic light in your town).  The site solves problems by using a 4 step process that turns abstract ideas into actionable tasks that anyone can carry out:

Step 1: Identifying the problem

Step 2: Crowdsourcing a solution

Step 3: Breaking the solution down to actionable tasks

Step 4: Committing to carrying out the actionable tasks  

Here is a proposal of the main features for Ideagrid. 

 * Incorporate your concerns of current events in the Problems tab. 
 * Propose your solutions in the Ideas tab. 
 * Look for actionable tasks you can carry out in the Tasks tab. 
 * Look for like-minded people with the right skills in the People tab.

Tools
-------

This project uses Ruby and Git along with a number of other tools and frameworks:

 * Padrino Web Framework (http://padrinorb.com)
 * MongoMapper and MongoDB
 * jquery javascript framework
 * riot unit testing
 * haml and sass template engines