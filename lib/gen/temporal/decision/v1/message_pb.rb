# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: temporal/decision/v1/message.proto

require 'google/protobuf'

require 'temporal/enums/v1/workflow_pb'
require 'temporal/enums/v1/decision_type_pb'
require 'temporal/common/v1/message_pb'
require 'temporal/failure/v1/message_pb'
require 'temporal/tasklist/v1/message_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("temporal/decision/v1/message.proto", :syntax => :proto3) do
    add_message "temporal.decision.v1.ScheduleActivityTaskDecisionAttributes" do
      optional :activity_id, :string, 1
      optional :activity_type, :message, 2, "temporal.common.v1.ActivityType"
      optional :namespace, :string, 3
      optional :task_list, :message, 4, "temporal.tasklist.v1.TaskList"
      optional :header, :message, 5, "temporal.common.v1.Header"
      optional :input, :message, 6, "temporal.common.v1.Payloads"
      optional :schedule_to_close_timeout_seconds, :int32, 7
      optional :schedule_to_start_timeout_seconds, :int32, 8
      optional :start_to_close_timeout_seconds, :int32, 9
      optional :heartbeat_timeout_seconds, :int32, 10
      optional :retry_policy, :message, 11, "temporal.common.v1.RetryPolicy"
    end
    add_message "temporal.decision.v1.RequestCancelActivityTaskDecisionAttributes" do
      optional :scheduled_event_id, :int64, 1
    end
    add_message "temporal.decision.v1.StartTimerDecisionAttributes" do
      optional :timer_id, :string, 1
      optional :start_to_fire_timeout_seconds, :int64, 2
    end
    add_message "temporal.decision.v1.CompleteWorkflowExecutionDecisionAttributes" do
      optional :result, :message, 1, "temporal.common.v1.Payloads"
    end
    add_message "temporal.decision.v1.FailWorkflowExecutionDecisionAttributes" do
      optional :failure, :message, 1, "temporal.failure.v1.Failure"
    end
    add_message "temporal.decision.v1.CancelTimerDecisionAttributes" do
      optional :timer_id, :string, 1
    end
    add_message "temporal.decision.v1.CancelWorkflowExecutionDecisionAttributes" do
      optional :details, :message, 1, "temporal.common.v1.Payloads"
    end
    add_message "temporal.decision.v1.RequestCancelExternalWorkflowExecutionDecisionAttributes" do
      optional :namespace, :string, 1
      optional :workflow_id, :string, 2
      optional :run_id, :string, 3
      optional :control, :string, 4
      optional :child_workflow_only, :bool, 5
    end
    add_message "temporal.decision.v1.SignalExternalWorkflowExecutionDecisionAttributes" do
      optional :namespace, :string, 1
      optional :execution, :message, 2, "temporal.common.v1.WorkflowExecution"
      optional :signal_name, :string, 3
      optional :input, :message, 4, "temporal.common.v1.Payloads"
      optional :control, :string, 5
      optional :child_workflow_only, :bool, 6
    end
    add_message "temporal.decision.v1.UpsertWorkflowSearchAttributesDecisionAttributes" do
      optional :search_attributes, :message, 1, "temporal.common.v1.SearchAttributes"
    end
    add_message "temporal.decision.v1.RecordMarkerDecisionAttributes" do
      optional :marker_name, :string, 1
      map :details, :string, :message, 2, "temporal.common.v1.Payloads"
      optional :header, :message, 3, "temporal.common.v1.Header"
      optional :failure, :message, 4, "temporal.failure.v1.Failure"
    end
    add_message "temporal.decision.v1.ContinueAsNewWorkflowExecutionDecisionAttributes" do
      optional :workflow_type, :message, 1, "temporal.common.v1.WorkflowType"
      optional :task_list, :message, 2, "temporal.tasklist.v1.TaskList"
      optional :input, :message, 3, "temporal.common.v1.Payloads"
      optional :workflow_run_timeout_seconds, :int32, 4
      optional :workflow_task_timeout_seconds, :int32, 5
      optional :backoff_start_interval_in_seconds, :int32, 6
      optional :retry_policy, :message, 7, "temporal.common.v1.RetryPolicy"
      optional :initiator, :enum, 8, "temporal.enums.v1.ContinueAsNewInitiator"
      optional :failure, :message, 9, "temporal.failure.v1.Failure"
      optional :last_completion_result, :message, 10, "temporal.common.v1.Payloads"
      optional :cron_schedule, :string, 11
      optional :header, :message, 12, "temporal.common.v1.Header"
      optional :memo, :message, 13, "temporal.common.v1.Memo"
      optional :search_attributes, :message, 14, "temporal.common.v1.SearchAttributes"
    end
    add_message "temporal.decision.v1.StartChildWorkflowExecutionDecisionAttributes" do
      optional :namespace, :string, 1
      optional :workflow_id, :string, 2
      optional :workflow_type, :message, 3, "temporal.common.v1.WorkflowType"
      optional :task_list, :message, 4, "temporal.tasklist.v1.TaskList"
      optional :input, :message, 5, "temporal.common.v1.Payloads"
      optional :workflow_execution_timeout_seconds, :int32, 6
      optional :workflow_run_timeout_seconds, :int32, 7
      optional :workflow_task_timeout_seconds, :int32, 8
      optional :parent_close_policy, :enum, 9, "temporal.enums.v1.ParentClosePolicy"
      optional :control, :string, 10
      optional :workflow_id_reuse_policy, :enum, 11, "temporal.enums.v1.WorkflowIdReusePolicy"
      optional :retry_policy, :message, 12, "temporal.common.v1.RetryPolicy"
      optional :cron_schedule, :string, 13
      optional :header, :message, 14, "temporal.common.v1.Header"
      optional :memo, :message, 15, "temporal.common.v1.Memo"
      optional :search_attributes, :message, 16, "temporal.common.v1.SearchAttributes"
    end
    add_message "temporal.decision.v1.Decision" do
      optional :decision_type, :enum, 1, "temporal.enums.v1.DecisionType"
      oneof :attributes do
        optional :schedule_activity_task_decision_attributes, :message, 2, "temporal.decision.v1.ScheduleActivityTaskDecisionAttributes"
        optional :start_timer_decision_attributes, :message, 3, "temporal.decision.v1.StartTimerDecisionAttributes"
        optional :complete_workflow_execution_decision_attributes, :message, 4, "temporal.decision.v1.CompleteWorkflowExecutionDecisionAttributes"
        optional :fail_workflow_execution_decision_attributes, :message, 5, "temporal.decision.v1.FailWorkflowExecutionDecisionAttributes"
        optional :request_cancel_activity_task_decision_attributes, :message, 6, "temporal.decision.v1.RequestCancelActivityTaskDecisionAttributes"
        optional :cancel_timer_decision_attributes, :message, 7, "temporal.decision.v1.CancelTimerDecisionAttributes"
        optional :cancel_workflow_execution_decision_attributes, :message, 8, "temporal.decision.v1.CancelWorkflowExecutionDecisionAttributes"
        optional :request_cancel_external_workflow_execution_decision_attributes, :message, 9, "temporal.decision.v1.RequestCancelExternalWorkflowExecutionDecisionAttributes"
        optional :record_marker_decision_attributes, :message, 10, "temporal.decision.v1.RecordMarkerDecisionAttributes"
        optional :continue_as_new_workflow_execution_decision_attributes, :message, 11, "temporal.decision.v1.ContinueAsNewWorkflowExecutionDecisionAttributes"
        optional :start_child_workflow_execution_decision_attributes, :message, 12, "temporal.decision.v1.StartChildWorkflowExecutionDecisionAttributes"
        optional :signal_external_workflow_execution_decision_attributes, :message, 13, "temporal.decision.v1.SignalExternalWorkflowExecutionDecisionAttributes"
        optional :upsert_workflow_search_attributes_decision_attributes, :message, 14, "temporal.decision.v1.UpsertWorkflowSearchAttributesDecisionAttributes"
      end
    end
  end
end

module Temporal
  module Proto
    module Decision
      module V1
        ScheduleActivityTaskDecisionAttributes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.decision.v1.ScheduleActivityTaskDecisionAttributes").msgclass
        RequestCancelActivityTaskDecisionAttributes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.decision.v1.RequestCancelActivityTaskDecisionAttributes").msgclass
        StartTimerDecisionAttributes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.decision.v1.StartTimerDecisionAttributes").msgclass
        CompleteWorkflowExecutionDecisionAttributes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.decision.v1.CompleteWorkflowExecutionDecisionAttributes").msgclass
        FailWorkflowExecutionDecisionAttributes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.decision.v1.FailWorkflowExecutionDecisionAttributes").msgclass
        CancelTimerDecisionAttributes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.decision.v1.CancelTimerDecisionAttributes").msgclass
        CancelWorkflowExecutionDecisionAttributes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.decision.v1.CancelWorkflowExecutionDecisionAttributes").msgclass
        RequestCancelExternalWorkflowExecutionDecisionAttributes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.decision.v1.RequestCancelExternalWorkflowExecutionDecisionAttributes").msgclass
        SignalExternalWorkflowExecutionDecisionAttributes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.decision.v1.SignalExternalWorkflowExecutionDecisionAttributes").msgclass
        UpsertWorkflowSearchAttributesDecisionAttributes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.decision.v1.UpsertWorkflowSearchAttributesDecisionAttributes").msgclass
        RecordMarkerDecisionAttributes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.decision.v1.RecordMarkerDecisionAttributes").msgclass
        ContinueAsNewWorkflowExecutionDecisionAttributes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.decision.v1.ContinueAsNewWorkflowExecutionDecisionAttributes").msgclass
        StartChildWorkflowExecutionDecisionAttributes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.decision.v1.StartChildWorkflowExecutionDecisionAttributes").msgclass
        Decision = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.decision.v1.Decision").msgclass
      end
    end
  end
end
