class SemestersController < ApplicationController
  before_action :set_semester, only: %i[ show edit update destroy ]

  # GET /semesters or /semesters.json
  def index
    @semesters = Semester.all
    @sum_money = 0
    @sum_credit = 0
    @average = 0.0
    @piece = 0.0
    @semesters.each do |semester|
      @sum_money += semester.money.to_f
      @average += semester.average.to_f
      @sum_credit += semester.credits
      @piece += 1
    end
    @average = @average/@piece
    @semesters = Semester.all.order(created_at: :asc).paginate(page: params[:page], per_page: 5)
  end

  # GET /semesters/1 or /semesters/1.json
  def show
    #@semester = Semester.new number: 1, credits: 30, average: 4.5, money:"20000Ft", id:1
  end

  # GET /semesters/new
  def new
    @semester = Semester.new
  end

  # GET /semesters/1/edit
  def edit
  end

  # POST /semesters or /semesters.json
  def create
    @semester = Semester.new(semester_params)

    respond_to do |format|
      if @semester.save
        format.html { redirect_to @semester, notice: "Semester was successfully created." }
        format.json { render :show, status: :created, location: @semester }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /semesters/1 or /semesters/1.json
  def update
    respond_to do |format|
      if @semester.update(semester_params)
        format.html { redirect_to @semester, notice: "Semester was successfully updated." }
        format.json { render :show, status: :ok, location: @semester }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /semesters/1 or /semesters/1.json
  def destroy
    @semester.destroy
    respond_to do |format|
      format.html { redirect_to semesters_url, notice: "Semester was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semester
      @semester = Semester.find(params[:id])
      #@semester = Semester.new number: 1, credits: 30, average: 4.5, money:"20000Ft", id:1
    end

    # Only allow a list of trusted parameters through.
    def semester_params
      params.require(:semester).permit(:number, :credits, :average, :money)
    end
end
