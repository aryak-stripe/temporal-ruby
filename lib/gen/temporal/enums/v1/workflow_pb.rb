# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: temporal/enums/v1/workflow.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("temporal/enums/v1/workflow.proto", :syntax => :proto3) do
    add_enum "temporal.enums.v1.WorkflowIdReusePolicy" do
      value :WORKFLOW_ID_REUSE_POLICY_UNSPECIFIED, 0
      value :WORKFLOW_ID_REUSE_POLICY_ALLOW_DUPLICATE, 1
      value :WORKFLOW_ID_REUSE_POLICY_ALLOW_DUPLICATE_FAILED_ONLY, 2
      value :WORKFLOW_ID_REUSE_POLICY_REJECT_DUPLICATE, 3
    end
    add_enum "temporal.enums.v1.ParentClosePolicy" do
      value :PARENT_CLOSE_POLICY_UNSPECIFIED, 0
      value :PARENT_CLOSE_POLICY_ABANDON, 1
      value :PARENT_CLOSE_POLICY_REQUEST_CANCEL, 2
      value :PARENT_CLOSE_POLICY_TERMINATE, 3
    end
    add_enum "temporal.enums.v1.ContinueAsNewInitiator" do
      value :CONTINUE_AS_NEW_INITIATOR_UNSPECIFIED, 0
      value :CONTINUE_AS_NEW_INITIATOR_DECIDER, 1
      value :CONTINUE_AS_NEW_INITIATOR_RETRY, 2
      value :CONTINUE_AS_NEW_INITIATOR_CRON_SCHEDULE, 3
    end
    add_enum "temporal.enums.v1.WorkflowExecutionStatus" do
      value :WORKFLOW_EXECUTION_STATUS_UNSPECIFIED, 0
      value :WORKFLOW_EXECUTION_STATUS_RUNNING, 1
      value :WORKFLOW_EXECUTION_STATUS_COMPLETED, 2
      value :WORKFLOW_EXECUTION_STATUS_FAILED, 3
      value :WORKFLOW_EXECUTION_STATUS_CANCELED, 4
      value :WORKFLOW_EXECUTION_STATUS_TERMINATED, 5
      value :WORKFLOW_EXECUTION_STATUS_CONTINUED_AS_NEW, 6
      value :WORKFLOW_EXECUTION_STATUS_TIMED_OUT, 7
    end
    add_enum "temporal.enums.v1.PendingActivityState" do
      value :PENDING_ACTIVITY_STATE_UNSPECIFIED, 0
      value :PENDING_ACTIVITY_STATE_SCHEDULED, 1
      value :PENDING_ACTIVITY_STATE_STARTED, 2
      value :PENDING_ACTIVITY_STATE_CANCEL_REQUESTED, 3
    end
    add_enum "temporal.enums.v1.HistoryEventFilterType" do
      value :HISTORY_EVENT_FILTER_TYPE_UNSPECIFIED, 0
      value :HISTORY_EVENT_FILTER_TYPE_ALL_EVENT, 1
      value :HISTORY_EVENT_FILTER_TYPE_CLOSE_EVENT, 2
    end
    add_enum "temporal.enums.v1.RetryStatus" do
      value :RETRY_STATUS_UNSPECIFIED, 0
      value :RETRY_STATUS_IN_PROGRESS, 1
      value :RETRY_STATUS_NON_RETRYABLE_FAILURE, 2
      value :RETRY_STATUS_TIMEOUT, 3
      value :RETRY_STATUS_MAXIMUM_ATTEMPTS_REACHED, 4
      value :RETRY_STATUS_RETRY_POLICY_NOT_SET, 5
      value :RETRY_STATUS_INTERNAL_SERVER_ERROR, 6
      value :RETRY_STATUS_CANCEL_REQUESTED, 7
    end
    add_enum "temporal.enums.v1.TimeoutType" do
      value :TIMEOUT_TYPE_UNSPECIFIED, 0
      value :TIMEOUT_TYPE_START_TO_CLOSE, 1
      value :TIMEOUT_TYPE_SCHEDULE_TO_START, 2
      value :TIMEOUT_TYPE_SCHEDULE_TO_CLOSE, 3
      value :TIMEOUT_TYPE_HEARTBEAT, 4
    end
  end
end

module Temporal
  module Proto
    module Enums
      module V1
        WorkflowIdReusePolicy = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.enums.v1.WorkflowIdReusePolicy").enummodule
        ParentClosePolicy = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.enums.v1.ParentClosePolicy").enummodule
        ContinueAsNewInitiator = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.enums.v1.ContinueAsNewInitiator").enummodule
        WorkflowExecutionStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.enums.v1.WorkflowExecutionStatus").enummodule
        PendingActivityState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.enums.v1.PendingActivityState").enummodule
        HistoryEventFilterType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.enums.v1.HistoryEventFilterType").enummodule
        RetryStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.enums.v1.RetryStatus").enummodule
        TimeoutType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.enums.v1.TimeoutType").enummodule
      end
    end
  end
end
