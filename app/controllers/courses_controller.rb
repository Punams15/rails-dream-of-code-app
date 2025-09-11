class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]
  before_action :set_collections, only: [:new, :edit]

  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new    # Make an empty course to fill in
    @coding_classes = CodingClass.all  # Get all coding classes so we can pick one
    @trimester = Trimester.all         # Get all trimesters so we can pick one
  end

  # GET /courses/1/edit
  def edit
      @course = Course.find(params[:id])
      @coding_classes = CodingClass.all 
      @trimester = Trimester.all

  end

  # POST /courses or /courses.json
  def create
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy!

    respond_to do |format|
      format.html { redirect_to courses_path, status: :see_other, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
   def set_course
  @course = Course.find(params[:id])
end

# METHOD missing last time
  def set_collections
    @coding_classes = CodingClass.all
    @trimesters = Trimester.all
  end
end

def course_params
  params.require(:course).permit(:coding_class_id, :trimester_id, :max_enrollment)
end




#note

#@coding_classes and @trimesters are needed for your form’s dropdowns.

#require(:course).permit(...) is the Rails convention for strong params.

#params[:id] is the normal way to grab the id in set_course.

#set_course: find the course with this number (ID) to look at or change it.

#course_params: filters out only these info to go into the course: coding class, trimester, max enrollment etc. 
