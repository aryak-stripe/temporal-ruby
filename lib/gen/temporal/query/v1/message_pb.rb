# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: temporal/query/v1/message.proto

require 'google/protobuf'

require 'temporal/enums/v1/query_pb'
require 'temporal/enums/v1/workflow_pb'
require 'temporal/common/v1/message_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("temporal/query/v1/message.proto", :syntax => :proto3) do
    add_message "temporal.query.v1.WorkflowQuery" do
      optional :query_type, :string, 1
      optional :query_args, :message, 2, "temporal.common.v1.Payloads"
    end
    add_message "temporal.query.v1.WorkflowQueryResult" do
      optional :result_type, :enum, 1, "temporal.enums.v1.QueryResultType"
      optional :answer, :message, 2, "temporal.common.v1.Payloads"
      optional :error_message, :string, 3
    end
    add_message "temporal.query.v1.QueryRejected" do
      optional :status, :enum, 1, "temporal.enums.v1.WorkflowExecutionStatus"
    end
  end
end

module Temporal
  module Proto
    module Query
      module V1
        WorkflowQuery = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.query.v1.WorkflowQuery").msgclass
        WorkflowQueryResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.query.v1.WorkflowQueryResult").msgclass
        QueryRejected = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.query.v1.QueryRejected").msgclass
      end
    end
  end
end
