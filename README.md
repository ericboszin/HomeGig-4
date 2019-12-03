# HomeGig-4
Project Repository for ECE444F Software Engineering 

## Components:

  ### Users:
  There are three types of users of the app: job owners, job workers, and admins. The user model contains various pieces of   information about the user, such as name and date of birth. The user type is specified through a 'role' attribute and an     'admin' attribute. A user has many jobs, reports, and one setting. A user also has many bids and reviews through jobs.
  
   #### Atrributes:
   * email
   * encrypted_password
   * first_name
   * last_name
   * birthday
   * country
   * phone
   * aboutme
   * role (owner/worker)
   * skill (Only applicable for worker. Example web development.)
   * admin (true/false)

  ### Jobs:
  A job owner can create a job for workers to bid on. The job model contains the details of the job. A job has many bids,     created by potential workers. A job also has many reviews, created after job completion by the job owner.

   #### Atrributes:
   * title
   * description
   * price
   * status (available, started, completed)
   * user_id (job owner id)
  
  ### Reports:
  A user can create a report, to complain to the admin about an issue. An admin can then see all open reports on their         homepage.

   #### Atrributes:
   * title
   * description
   * user_id (report creator id)
  
  ### Bids:
  A potential worker interested in a job can create a bid for the job. The job owner can then choose to accept a bid.

   #### Atrributes:
   * description
   * amount
   * user_id (bid creator id)
   
  ### Reviews:
  A jow owner can create a review after job completion. A review consists of a description and a rating. A worker's reviews   can be seen on their profile page.

   #### Atrributes:
   * text
   * rating
   * user_id (review creator id)
   * worker_id (reviewed worker id)
   

  ### User Authentication:
  Devise is used for user authentication and authorization. A user cannot access the app without a valid account. At signup   a user specifies their role, job owner or worker. The user's home page, permissible actions and views depend on the user     role. Admin accounts are created manually and seeded into the database.

  ### Payments:
  
  ### Emails/Notifications:
  Users will receive confirmation emails for sign up and password reset.
  Owners can receive emails when:
   * they have created a job.
   * they have edited a job.
   * they have deleted a job.
   * their job has received a bid.
   * a bid of their job has been updated.
   * they have posted a review of a worker.
   * they have edited a review of a worker. 
  Workers can receive emails when:
   * their bid has been accepted or reverted.
   * a job they bid for has been started, completed or cancelled.
   * they have received a review from a job owner.

   These emails can be toggled on/off in the notifications settings page. 









