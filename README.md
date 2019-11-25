# HomeGig-4
Project Repository for ECE444F Software Engineering 

## Models:
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

  A job owner can create a job for workers to bid on. The job model contains the details of the job, including the job name,   job description, the price a job owner is willing to pay, and the completion status of the job. A job has many bids,         created by potential workers. A job also has many reviews, created after job completion by the job owner.

  ### Reports:

  A user can create a report, to complain to the admin about an issue. The report model contains attributes for the report     name and description.


  ### Bids:

  A potential worker interested in a job can create a bid for the job. The bid model contains attributes for a bid             description and amount. The job owner can then choose to accept a bid.

  ### Reviews:

  A jow owner can create a review after job completion. A review consists of a description and a rating.

  ### User Authentication:

  Devise is used for user authentication and authorization. A user cannot access the app without a valid account. At signup   a user specifies their role, job owner or worker. The user's home page, permissible actions and views depend on the user     role. Admin accounts are created manually and seeded into the database.

  ### Payments:









