require 'test_helper'

class PerfTypesControllerTest < ActionController::TestCase
  setup do
    @perf_type = perf_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:perf_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create perf_type" do
    assert_difference('PerfType.count') do
      post :create, perf_type: { as: @perf_type.as, cq: @perf_type.cq, db: @perf_type.db, io: @perf_type.io, po: @perf_type.po, ps: @perf_type.ps, pt: @perf_type.pt, question_id: @perf_type.question_id, student_id: @perf_type.student_id }
    end

    assert_redirected_to perf_type_path(assigns(:perf_type))
  end

  test "should show perf_type" do
    get :show, id: @perf_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @perf_type
    assert_response :success
  end

  test "should update perf_type" do
    patch :update, id: @perf_type, perf_type: { as: @perf_type.as, cq: @perf_type.cq, db: @perf_type.db, io: @perf_type.io, po: @perf_type.po, ps: @perf_type.ps, pt: @perf_type.pt, question_id: @perf_type.question_id, student_id: @perf_type.student_id }
    assert_redirected_to perf_type_path(assigns(:perf_type))
  end

  test "should destroy perf_type" do
    assert_difference('PerfType.count', -1) do
      delete :destroy, id: @perf_type
    end

    assert_redirected_to perf_types_path
  end
end
