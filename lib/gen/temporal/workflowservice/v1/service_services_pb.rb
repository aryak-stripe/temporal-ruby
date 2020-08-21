# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: temporal/workflowservice/v1/service.proto for package 'Temporal.Proto.WorkflowService.V1'
# Original file comments:
# The MIT License
#
# Copyright (c) 2020 Temporal Technologies Inc.  All rights reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

require 'grpc'
require 'temporal/workflowservice/v1/service_pb'

module Temporal
  module Proto
    module WorkflowService
      module V1
        module WorkflowService
          # WorkflowService API is exposed to provide support for long running applications.  Application is expected to call
          # StartWorkflowExecution to create an instance for each instance of long running workflow.  Such applications are expected
          # to have a worker which regularly polls for DecisionTask and ActivityTask from the WorkflowService.  For each
          # DecisionTask, application is expected to process the history of events for that session and respond back with next
          # decisions.  For each ActivityTask, application is expected to execute the actual logic for that task and respond back
          # with completion or failure.  Worker is expected to regularly heartbeat while activity task is running.
          class Service

            include GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'temporal.workflowservice.v1.WorkflowService'

            # RegisterNamespace creates a new namespace which can be used as a container for all resources.  Namespace is a top level
            # entity within Temporal, used as a container for all resources like workflow executions, task lists, etc.  Namespace
            # acts as a sandbox and provides isolation for all resources within the namespace.  All resources belongs to exactly one
            # namespace.
            rpc :RegisterNamespace, Temporal::Proto::WorkflowService::V1::RegisterNamespaceRequest, Temporal::Proto::WorkflowService::V1::RegisterNamespaceResponse
            # DescribeNamespace returns the information and configuration for a registered namespace.
            rpc :DescribeNamespace, Temporal::Proto::WorkflowService::V1::DescribeNamespaceRequest, Temporal::Proto::WorkflowService::V1::DescribeNamespaceResponse
            # ListNamespaces returns the information and configuration for all namespaces.
            rpc :ListNamespaces, Temporal::Proto::WorkflowService::V1::ListNamespacesRequest, Temporal::Proto::WorkflowService::V1::ListNamespacesResponse
            # UpdateNamespace is used to update the information and configuration for a registered namespace.
            rpc :UpdateNamespace, Temporal::Proto::WorkflowService::V1::UpdateNamespaceRequest, Temporal::Proto::WorkflowService::V1::UpdateNamespaceResponse
            # DeprecateNamespace us used to update status of a registered namespace to DEPRECATED.  Once the namespace is deprecated
            # it cannot be used to start new workflow executions.  Existing workflow executions will continue to run on
            # deprecated namespaces.
            rpc :DeprecateNamespace, Temporal::Proto::WorkflowService::V1::DeprecateNamespaceRequest, Temporal::Proto::WorkflowService::V1::DeprecateNamespaceResponse
            # StartWorkflowExecution starts a new long running workflow instance.  It will create the instance with
            # 'WorkflowExecutionStarted' event in history and also schedule the first DecisionTask for the worker to make the
            # first decision for this instance.  It will return 'WorkflowExecutionAlreadyStartedFailure', if an instance already
            # exists with same workflowId.
            rpc :StartWorkflowExecution, Temporal::Proto::WorkflowService::V1::StartWorkflowExecutionRequest, Temporal::Proto::WorkflowService::V1::StartWorkflowExecutionResponse
            # GetWorkflowExecutionHistory returns the history of specified workflow execution.  It fails with 'NotFoundFailure' if specified workflow
            # execution in unknown to the service.
            rpc :GetWorkflowExecutionHistory, Temporal::Proto::WorkflowService::V1::GetWorkflowExecutionHistoryRequest, Temporal::Proto::WorkflowService::V1::GetWorkflowExecutionHistoryResponse
            # PollForDecisionTask is called by application worker to process DecisionTask from a specific task list.  A
            # DecisionTask is dispatched to callers for active workflow executions, with pending decisions.
            # Application is then expected to call 'RespondDecisionTaskCompleted' API when it is done processing the DecisionTask.
            # It will also create a 'DecisionTaskStarted' event in the history for that session before handing off DecisionTask to
            # application worker.
            rpc :PollForDecisionTask, Temporal::Proto::WorkflowService::V1::PollForDecisionTaskRequest, Temporal::Proto::WorkflowService::V1::PollForDecisionTaskResponse
            # RespondDecisionTaskCompleted is called by application worker to complete a DecisionTask handed as a result of
            # 'PollForDecisionTask' API call.  Completing a DecisionTask will result in new events for the workflow execution and
            # potentially new ActivityTask being created for corresponding decisions.  It will also create a DecisionTaskCompleted
            # event in the history for that session.  Use the 'taskToken' provided as response of PollForDecisionTask API call
            # for completing the DecisionTask.
            # The response could contain a new decision task if there is one or if the request asking for one.
            rpc :RespondDecisionTaskCompleted, Temporal::Proto::WorkflowService::V1::RespondDecisionTaskCompletedRequest, Temporal::Proto::WorkflowService::V1::RespondDecisionTaskCompletedResponse
            # RespondDecisionTaskFailed is called by application worker to indicate failure.  This results in
            # DecisionTaskFailedEvent written to the history and a new DecisionTask created.  This API can be used by client to
            # either clear sticky task list or report any panics during DecisionTask processing.  Temporal will only append first
            # DecisionTaskFailed event to the history of workflow execution for consecutive failures.
            rpc :RespondDecisionTaskFailed, Temporal::Proto::WorkflowService::V1::RespondDecisionTaskFailedRequest, Temporal::Proto::WorkflowService::V1::RespondDecisionTaskFailedResponse
            # PollForActivityTask is called by application worker to process ActivityTask from a specific task list.  ActivityTask
            # is dispatched to callers whenever a ScheduleTask decision is made for a workflow execution.
            # Application is expected to call 'RespondActivityTaskCompleted' or 'RespondActivityTaskFailed' once it is done
            # processing the task.
            # Application also needs to call 'RecordActivityTaskHeartbeat' API within 'heartbeatTimeoutSeconds' interval to
            # prevent the task from getting timed out.  An event 'ActivityTaskStarted' event is also written to workflow execution
            # history before the ActivityTask is dispatched to application worker.
            rpc :PollForActivityTask, Temporal::Proto::WorkflowService::V1::PollForActivityTaskRequest, Temporal::Proto::WorkflowService::V1::PollForActivityTaskResponse
            # RecordActivityTaskHeartbeat is called by application worker while it is processing an ActivityTask.  If worker fails
            # to heartbeat within 'heartbeatTimeoutSeconds' interval for the ActivityTask, then it will be marked as timedout and
            # 'ActivityTaskTimedOut' event will be written to the workflow history.  Calling 'RecordActivityTaskHeartbeat' will
            # fail with 'NotFoundFailure' in such situations.  Use the 'taskToken' provided as response of
            # PollForActivityTask API call for heart beating.
            rpc :RecordActivityTaskHeartbeat, Temporal::Proto::WorkflowService::V1::RecordActivityTaskHeartbeatRequest, Temporal::Proto::WorkflowService::V1::RecordActivityTaskHeartbeatResponse
            # RecordActivityTaskHeartbeatById is called by application worker while it is processing an ActivityTask.  If worker fails
            # to heartbeat within 'heartbeatTimeoutSeconds' interval for the ActivityTask, then it will be marked as timed out and
            # 'ActivityTaskTimedOut' event will be written to the workflow history.  Calling 'RecordActivityTaskHeartbeatById' will
            # fail with 'NotFoundFailure' in such situations.  Instead of using 'taskToken' like in RecordActivityTaskHeartbeat,
            # use Namespace, WorkflowId and ActivityId
            rpc :RecordActivityTaskHeartbeatById, Temporal::Proto::WorkflowService::V1::RecordActivityTaskHeartbeatByIdRequest, Temporal::Proto::WorkflowService::V1::RecordActivityTaskHeartbeatByIdResponse
            # RespondActivityTaskCompleted is called by application worker when it is done processing an ActivityTask.  It will
            # result in a new 'ActivityTaskCompleted' event being written to the workflow history and a new DecisionTask
            # created for the workflow so new decisions could be made.  Use the 'taskToken' provided as response of
            # PollForActivityTask API call for completion. It fails with 'NotFoundFailure' if the taskToken is not valid
            # anymore due to activity timeout.
            rpc :RespondActivityTaskCompleted, Temporal::Proto::WorkflowService::V1::RespondActivityTaskCompletedRequest, Temporal::Proto::WorkflowService::V1::RespondActivityTaskCompletedResponse
            # RespondActivityTaskCompletedById is called by application worker when it is done processing an ActivityTask.
            # It will result in a new 'ActivityTaskCompleted' event being written to the workflow history and a new DecisionTask
            # created for the workflow so new decisions could be made.  Similar to RespondActivityTaskCompleted but use Namespace,
            # WorkflowId and ActivityId instead of 'taskToken' for completion. It fails with 'NotFoundFailure'
            # if the these Ids are not valid anymore due to activity timeout.
            rpc :RespondActivityTaskCompletedById, Temporal::Proto::WorkflowService::V1::RespondActivityTaskCompletedByIdRequest, Temporal::Proto::WorkflowService::V1::RespondActivityTaskCompletedByIdResponse
            # RespondActivityTaskFailed is called by application worker when it is done processing an ActivityTask.  It will
            # result in a new 'ActivityTaskFailed' event being written to the workflow history and a new DecisionTask
            # created for the workflow instance so new decisions could be made.  Use the 'taskToken' provided as response of
            # PollForActivityTask API call for completion. It fails with 'NotFoundFailure' if the taskToken is not valid
            # anymore due to activity timeout.
            rpc :RespondActivityTaskFailed, Temporal::Proto::WorkflowService::V1::RespondActivityTaskFailedRequest, Temporal::Proto::WorkflowService::V1::RespondActivityTaskFailedResponse
            # RespondActivityTaskFailedById is called by application worker when it is done processing an ActivityTask.
            # It will result in a new 'ActivityTaskFailed' event being written to the workflow history and a new DecisionTask
            # created for the workflow instance so new decisions could be made.  Similar to RespondActivityTaskFailed but use
            # Namespace, WorkflowId and ActivityId instead of 'taskToken' for completion. It fails with 'NotFoundFailure'
            # if the these Ids are not valid anymore due to activity timeout.
            rpc :RespondActivityTaskFailedById, Temporal::Proto::WorkflowService::V1::RespondActivityTaskFailedByIdRequest, Temporal::Proto::WorkflowService::V1::RespondActivityTaskFailedByIdResponse
            # RespondActivityTaskCanceled is called by application worker when it is successfully canceled an ActivityTask.  It will
            # result in a new 'ActivityTaskCanceled' event being written to the workflow history and a new DecisionTask
            # created for the workflow instance so new decisions could be made.  Use the 'taskToken' provided as response of
            # PollForActivityTask API call for completion. It fails with 'NotFoundFailure' if the taskToken is not valid
            # anymore due to activity timeout.
            rpc :RespondActivityTaskCanceled, Temporal::Proto::WorkflowService::V1::RespondActivityTaskCanceledRequest, Temporal::Proto::WorkflowService::V1::RespondActivityTaskCanceledResponse
            # RespondActivityTaskCanceledById is called by application worker when it is successfully canceled an ActivityTask.
            # It will result in a new 'ActivityTaskCanceled' event being written to the workflow history and a new DecisionTask
            # created for the workflow instance so new decisions could be made.  Similar to RespondActivityTaskCanceled but use
            # Namespace, WorkflowId and ActivityId instead of 'taskToken' for completion. It fails with 'NotFoundFailure'
            # if the these Ids are not valid anymore due to activity timeout.
            rpc :RespondActivityTaskCanceledById, Temporal::Proto::WorkflowService::V1::RespondActivityTaskCanceledByIdRequest, Temporal::Proto::WorkflowService::V1::RespondActivityTaskCanceledByIdResponse
            # RequestCancelWorkflowExecution is called by application worker when it wants to request cancellation of a workflow instance.
            # It will result in a new 'WorkflowExecutionCancelRequested' event being written to the workflow history and a new DecisionTask
            # created for the workflow instance so new decisions could be made. It fails with 'NotFoundFailure' if the workflow is not valid
            # anymore due to completion or doesn't exist.
            rpc :RequestCancelWorkflowExecution, Temporal::Proto::WorkflowService::V1::RequestCancelWorkflowExecutionRequest, Temporal::Proto::WorkflowService::V1::RequestCancelWorkflowExecutionResponse
            # SignalWorkflowExecution is used to send a signal event to running workflow execution.  This results in
            # WorkflowExecutionSignaled event recorded in the history and a decision task being created for the execution.
            rpc :SignalWorkflowExecution, Temporal::Proto::WorkflowService::V1::SignalWorkflowExecutionRequest, Temporal::Proto::WorkflowService::V1::SignalWorkflowExecutionResponse
            # SignalWithStartWorkflowExecution is used to ensure sending signal to a workflow.
            # If the workflow is running, this results in WorkflowExecutionSignaled event being recorded in the history
            # and a decision task being created for the execution.
            # If the workflow is not running or not found, this results in WorkflowExecutionStarted and WorkflowExecutionSignaled
            # events being recorded in history, and a decision task being created for the execution
            rpc :SignalWithStartWorkflowExecution, Temporal::Proto::WorkflowService::V1::SignalWithStartWorkflowExecutionRequest, Temporal::Proto::WorkflowService::V1::SignalWithStartWorkflowExecutionResponse
            # ResetWorkflowExecution reset an existing workflow execution to DecisionTaskCompleted event(exclusive).
            # And it will immediately terminating the current execution instance.
            rpc :ResetWorkflowExecution, Temporal::Proto::WorkflowService::V1::ResetWorkflowExecutionRequest, Temporal::Proto::WorkflowService::V1::ResetWorkflowExecutionResponse
            # TerminateWorkflowExecution terminates an existing workflow execution by recording WorkflowExecutionTerminated event
            # in the history and immediately terminating the execution instance.
            rpc :TerminateWorkflowExecution, Temporal::Proto::WorkflowService::V1::TerminateWorkflowExecutionRequest, Temporal::Proto::WorkflowService::V1::TerminateWorkflowExecutionResponse
            # ListOpenWorkflowExecutions is a visibility API to list the open executions in a specific namespace.
            rpc :ListOpenWorkflowExecutions, Temporal::Proto::WorkflowService::V1::ListOpenWorkflowExecutionsRequest, Temporal::Proto::WorkflowService::V1::ListOpenWorkflowExecutionsResponse
            # ListClosedWorkflowExecutions is a visibility API to list the closed executions in a specific namespace.
            rpc :ListClosedWorkflowExecutions, Temporal::Proto::WorkflowService::V1::ListClosedWorkflowExecutionsRequest, Temporal::Proto::WorkflowService::V1::ListClosedWorkflowExecutionsResponse
            # ListWorkflowExecutions is a visibility API to list workflow executions in a specific namespace.
            rpc :ListWorkflowExecutions, Temporal::Proto::WorkflowService::V1::ListWorkflowExecutionsRequest, Temporal::Proto::WorkflowService::V1::ListWorkflowExecutionsResponse
            # ListArchivedWorkflowExecutions is a visibility API to list archived workflow executions in a specific namespace.
            rpc :ListArchivedWorkflowExecutions, Temporal::Proto::WorkflowService::V1::ListArchivedWorkflowExecutionsRequest, Temporal::Proto::WorkflowService::V1::ListArchivedWorkflowExecutionsResponse
            # ScanWorkflowExecutions is a visibility API to list large amount of workflow executions in a specific namespace without order.
            rpc :ScanWorkflowExecutions, Temporal::Proto::WorkflowService::V1::ScanWorkflowExecutionsRequest, Temporal::Proto::WorkflowService::V1::ScanWorkflowExecutionsResponse
            # CountWorkflowExecutions is a visibility API to count of workflow executions in a specific namespace.
            rpc :CountWorkflowExecutions, Temporal::Proto::WorkflowService::V1::CountWorkflowExecutionsRequest, Temporal::Proto::WorkflowService::V1::CountWorkflowExecutionsResponse
            # GetSearchAttributes is a visibility API to get all legal keys that could be used in list APIs
            rpc :GetSearchAttributes, Temporal::Proto::WorkflowService::V1::GetSearchAttributesRequest, Temporal::Proto::WorkflowService::V1::GetSearchAttributesResponse
            # RespondQueryTaskCompleted is called by application worker to complete a QueryTask (which is a DecisionTask for query)
            # as a result of 'PollForDecisionTask' API call. Completing a QueryTask will unblock the client call to 'QueryWorkflow'
            # API and return the query result to client as a response to 'QueryWorkflow' API call.
            rpc :RespondQueryTaskCompleted, Temporal::Proto::WorkflowService::V1::RespondQueryTaskCompletedRequest, Temporal::Proto::WorkflowService::V1::RespondQueryTaskCompletedResponse
            # ResetStickyTaskList resets the sticky task list related information in mutable state of a given workflow.
            # Things cleared are:
            # 1. StickyTaskList
            # 2. StickyScheduleToStartTimeout
            # 3. ClientLibraryVersion
            # 4. ClientFeatureVersion
            # 5. ClientImpl
            rpc :ResetStickyTaskList, Temporal::Proto::WorkflowService::V1::ResetStickyTaskListRequest, Temporal::Proto::WorkflowService::V1::ResetStickyTaskListResponse
            # QueryWorkflow returns query result for a specified workflow execution
            rpc :QueryWorkflow, Temporal::Proto::WorkflowService::V1::QueryWorkflowRequest, Temporal::Proto::WorkflowService::V1::QueryWorkflowResponse
            # DescribeWorkflowExecution returns information about the specified workflow execution.
            rpc :DescribeWorkflowExecution, Temporal::Proto::WorkflowService::V1::DescribeWorkflowExecutionRequest, Temporal::Proto::WorkflowService::V1::DescribeWorkflowExecutionResponse
            # DescribeTaskList returns information about the target task list, right now this API returns the
            # pollers which polled this task list in last few minutes.
            rpc :DescribeTaskList, Temporal::Proto::WorkflowService::V1::DescribeTaskListRequest, Temporal::Proto::WorkflowService::V1::DescribeTaskListResponse
            # GetClusterInfo returns information about temporal cluster
            rpc :GetClusterInfo, Temporal::Proto::WorkflowService::V1::GetClusterInfoRequest, Temporal::Proto::WorkflowService::V1::GetClusterInfoResponse
            rpc :ListTaskListPartitions, Temporal::Proto::WorkflowService::V1::ListTaskListPartitionsRequest, Temporal::Proto::WorkflowService::V1::ListTaskListPartitionsResponse
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end
