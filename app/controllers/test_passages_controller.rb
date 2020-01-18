class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now

      added_badges = BadgesService.new(@test_passage, current_user).call
      added_badges.each do |badge|
        TestsMailer.recieved_badge(badge, current_user).deliver_now
      end unless added_badges.count.zero?

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.success?
      gist = Gist.create(
        question: @test_passage.current_question,
        link_to: result[:html_url],
        user: current_user
      )
      flash[:notice] = t('.success_html', gist_url: result[:html_url])
    else
      flash[:alert] = t('.falure')
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
