# stt(SpeechToText) backend

You can convert audio (.mp3) file to text using this rails application.

## Getting Started

1. Clone the repository: 
`git clone `
2. Install dependencies: 
`bundle install`
3. Create and migrate the database: 
`rails db:create && rails db:migrate`
4. Start the server: 
`rails server`

## Sidekiq

This application uses Sidekiq for background job processing. To start Sidekiq, run the following command in your terminal:

`bundle exec sidekiq -C config/sidekiq.yml`

This will start the Sidekiq process and begin processing jobs.