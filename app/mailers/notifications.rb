class Notifications < ActionMailer::Base
 def test_completed_message(user)
   @user = user
   mail :to => user.email, :from => 'nickyhughes00@gmail.com', :subject => "#{@user.results.last.quiz.name} completed! #{@user.results.last.score}"
 end
end