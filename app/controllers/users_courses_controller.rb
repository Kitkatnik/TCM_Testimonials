class UsersCoursesController < ApplicationController
  def create
    user = User.find params[:user_id]
    course = Course.find_by_code params[:course_code]

    if course
      user.courses << course unless user.course_ids.include? course.id
      redirect_to :back, notice: "Course added"
    else
      redirect_to :back, alert: "Course Code is invalid"
    end
  end
end
