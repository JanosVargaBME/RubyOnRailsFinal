class SemestersubjectsController < ApplicationController
  before_action :set_semestersubject, only: %i[ show edit update destroy ]

  # GET /semestersubjects or /semestersubjects.json
  def index
    @userid = find_user.id
    @allsemestersubjects = Semestersubject.all.order(created_at: :asc)
    @semestersubjectsfiltered = []
    @sum_credit = 0
    @sum_average = 0.0
    @piece = 0.0
    @allsemestersubjects.each do |semestersubject|
      if semestersubject.user_id == @userid
        @semestersubjectsfiltered << semestersubject
        @sum_credit += semestersubject.subject.credit.to_i
        @sum_average += semestersubject.mark.to_f
        @piece += 1
      end
    end
    @semestersubjects = @semestersubjectsfiltered
    @sum_average = @sum_average/@piece
  end

  # GET /semestersubjects/1 or /semestersubjects/1.json
  def show
  end

  # GET /semestersubjects/new
  def new
    @semestersubject = Semestersubject.new
    @userid = find_user.id
  end

  # GET /semestersubjects/1/edit
  def edit
  end

  # POST /semestersubjects or /semestersubjects.json
  def create
    @userid = find_user.id
    @semestersubject = Semestersubject.new(semestersubject_params)
    @semestersubject.user_id = find_user.id
    respond_to do |format|
      if @semestersubject.save
        format.html { redirect_to @semestersubject, notice: "Semestersubject was successfully created." }
        format.json { render :show, status: :created, location: @semestersubject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @semestersubject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /semestersubjects/1 or /semestersubjects/1.json
  def update
    respond_to do |format|
      if @semestersubject.update(semestersubject_params)
        format.html { redirect_to @semestersubject, notice: "Semestersubject was successfully updated." }
        format.json { render :show, status: :ok, location: @semestersubject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @semestersubject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /semestersubjects/1 or /semestersubjects/1.json
  def destroy
    @semestersubject.destroy
    respond_to do |format|
      format.html { redirect_to semestersubjects_url, notice: "Semestersubject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semestersubject
      @semestersubject = Semestersubject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def semestersubject_params
      params.require(:semestersubject).permit(:subject_id, :homework, :labor, :exam, :mark)
    end
end
