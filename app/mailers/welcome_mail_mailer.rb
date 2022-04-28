class WelcomeMailMailer < ApplicationMailer
  def create_mail(myobject)
    @myobject = myobject
    # how many object are there in db for that particular model after creating this object
    @myobject_count = myobject.class.count
    attachments.inline["filename.jpg"] = File.read("/home/rutikpatel/Desktop/GitPrac/RailsPractical/public#{@myobject.picture.url}")
    mail(
      to: @myobject.email,
      cc: User2.all.pluck(:email),
      subject: "A new #{myobject.class} has been created",
    )
  end

  def update_mail
    @user2 = params[:user2]
    attachments.inline["filename.jpg"] = File.read("/home/rutikpatel/Desktop/GitPrac/RailsPractical/public#{@user2.picture.url}")
    mail(to: @user2.email, subject: "A new #{@user2.class} has been updated") do |format|
      format.html { render layout: "update_mail" }
      format.text
    end
  end

  def delete_mail(myobject)
    @myobject = myobject
    @myobject_count = myobject.class.count
    mail to: "admin@example.com", subject: "A new #{myobject.class} has been delete"
  end
end
