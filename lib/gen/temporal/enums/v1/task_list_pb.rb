# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: temporal/enums/v1/task_list.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("temporal/enums/v1/task_list.proto", :syntax => :proto3) do
    add_enum "temporal.enums.v1.TaskListKind" do
      value :TASK_LIST_KIND_UNSPECIFIED, 0
      value :TASK_LIST_KIND_NORMAL, 1
      value :TASK_LIST_KIND_STICKY, 2
    end
    add_enum "temporal.enums.v1.TaskListType" do
      value :TASK_LIST_TYPE_UNSPECIFIED, 0
      value :TASK_LIST_TYPE_DECISION, 1
      value :TASK_LIST_TYPE_ACTIVITY, 2
    end
  end
end

module Temporal
  module Proto
    module Enums
      module V1
        TaskListKind = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.enums.v1.TaskListKind").enummodule
        TaskListType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.enums.v1.TaskListType").enummodule
      end
    end
  end
end
