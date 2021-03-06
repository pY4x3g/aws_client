// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822fromJson,
        rfc822toJson,
        iso8601fromJson,
        iso8601toJson,
        unixFromJson,
        unixToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'swf-2012-01-25.g.dart';

/// The Amazon Simple Workflow Service (Amazon SWF) makes it easy to build
/// applications that use Amazon's cloud to coordinate work across distributed
/// components. In Amazon SWF, a <i>task</i> represents a logical unit of work
/// that is performed by a component of your workflow. Coordinating tasks in a
/// workflow involves managing intertask dependencies, scheduling, and
/// concurrency in accordance with the logical flow of the application.
class SWF {
  final _s.JsonProtocol _protocol;
  SWF({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'swf',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Returns the number of closed workflow executions within the given domain
  /// that meet the specified filtering criteria.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>tagFilter.tag</code>: String constraint. The key is
  /// <code>swf:tagFilter.tag</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.name</code>: String constraint. The key is
  /// <code>swf:typeFilter.name</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.version</code>: String constraint. The key is
  /// <code>swf:typeFilter.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the workflow executions to count.
  ///
  /// Parameter [closeStatusFilter] :
  /// If specified, only workflow executions that match this close status are
  /// counted. This filter has an affect only if <code>executionStatus</code> is
  /// specified as <code>CLOSED</code>.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  ///
  /// Parameter [closeTimeFilter] :
  /// If specified, only workflow executions that meet the close time criteria
  /// of the filter are counted.
  /// <note>
  /// <code>startTimeFilter</code> and <code>closeTimeFilter</code> are mutually
  /// exclusive. You must specify one of these in a request but not both.
  /// </note>
  ///
  /// Parameter [executionFilter] :
  /// If specified, only workflow executions matching the
  /// <code>WorkflowId</code> in the filter are counted.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  ///
  /// Parameter [startTimeFilter] :
  /// If specified, only workflow executions that meet the start time criteria
  /// of the filter are counted.
  /// <note>
  /// <code>startTimeFilter</code> and <code>closeTimeFilter</code> are mutually
  /// exclusive. You must specify one of these in a request but not both.
  /// </note>
  ///
  /// Parameter [tagFilter] :
  /// If specified, only executions that have a tag that matches the filter are
  /// counted.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  ///
  /// Parameter [typeFilter] :
  /// If specified, indicates the type of the workflow executions to be counted.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  Future<WorkflowExecutionCount> countClosedWorkflowExecutions({
    @_s.required String domain,
    CloseStatusFilter closeStatusFilter,
    ExecutionTimeFilter closeTimeFilter,
    WorkflowExecutionFilter executionFilter,
    ExecutionTimeFilter startTimeFilter,
    TagFilter tagFilter,
    WorkflowTypeFilter typeFilter,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.CountClosedWorkflowExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'closeStatusFilter': closeStatusFilter,
        'closeTimeFilter': closeTimeFilter,
        'executionFilter': executionFilter,
        'startTimeFilter': startTimeFilter,
        'tagFilter': tagFilter,
        'typeFilter': typeFilter,
      },
    );

    return WorkflowExecutionCount.fromJson(jsonResponse.body);
  }

  /// Returns the number of open workflow executions within the given domain
  /// that meet the specified filtering criteria.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>tagFilter.tag</code>: String constraint. The key is
  /// <code>swf:tagFilter.tag</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.name</code>: String constraint. The key is
  /// <code>swf:typeFilter.name</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.version</code>: String constraint. The key is
  /// <code>swf:typeFilter.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the workflow executions to count.
  ///
  /// Parameter [startTimeFilter] :
  /// Specifies the start time criteria that workflow executions must meet in
  /// order to be counted.
  ///
  /// Parameter [executionFilter] :
  /// If specified, only workflow executions matching the
  /// <code>WorkflowId</code> in the filter are counted.
  /// <note>
  /// <code>executionFilter</code>, <code>typeFilter</code> and
  /// <code>tagFilter</code> are mutually exclusive. You can specify at most one
  /// of these in a request.
  /// </note>
  ///
  /// Parameter [tagFilter] :
  /// If specified, only executions that have a tag that matches the filter are
  /// counted.
  /// <note>
  /// <code>executionFilter</code>, <code>typeFilter</code> and
  /// <code>tagFilter</code> are mutually exclusive. You can specify at most one
  /// of these in a request.
  /// </note>
  ///
  /// Parameter [typeFilter] :
  /// Specifies the type of the workflow executions to be counted.
  /// <note>
  /// <code>executionFilter</code>, <code>typeFilter</code> and
  /// <code>tagFilter</code> are mutually exclusive. You can specify at most one
  /// of these in a request.
  /// </note>
  Future<WorkflowExecutionCount> countOpenWorkflowExecutions({
    @_s.required String domain,
    @_s.required ExecutionTimeFilter startTimeFilter,
    WorkflowExecutionFilter executionFilter,
    TagFilter tagFilter,
    WorkflowTypeFilter typeFilter,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(startTimeFilter, 'startTimeFilter');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.CountOpenWorkflowExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'startTimeFilter': startTimeFilter,
        'executionFilter': executionFilter,
        'tagFilter': tagFilter,
        'typeFilter': typeFilter,
      },
    );

    return WorkflowExecutionCount.fromJson(jsonResponse.body);
  }

  /// Returns the estimated number of activity tasks in the specified task list.
  /// The count returned is an approximation and isn't guaranteed to be exact.
  /// If you specify a task list that no activity task was ever scheduled in
  /// then <code>0</code> is returned.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the <code>taskList.name</code> parameter by using a
  /// <code>Condition</code> element with the <code>swf:taskList.name</code> key
  /// to allow the action to access only certain task lists.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the task list.
  ///
  /// Parameter [taskList] :
  /// The name of the task list.
  Future<PendingTaskCount> countPendingActivityTasks({
    @_s.required String domain,
    @_s.required TaskList taskList,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(taskList, 'taskList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.CountPendingActivityTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'taskList': taskList,
      },
    );

    return PendingTaskCount.fromJson(jsonResponse.body);
  }

  /// Returns the estimated number of decision tasks in the specified task list.
  /// The count returned is an approximation and isn't guaranteed to be exact.
  /// If you specify a task list that no decision task was ever scheduled in
  /// then <code>0</code> is returned.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the <code>taskList.name</code> parameter by using a
  /// <code>Condition</code> element with the <code>swf:taskList.name</code> key
  /// to allow the action to access only certain task lists.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the task list.
  ///
  /// Parameter [taskList] :
  /// The name of the task list.
  Future<PendingTaskCount> countPendingDecisionTasks({
    @_s.required String domain,
    @_s.required TaskList taskList,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(taskList, 'taskList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.CountPendingDecisionTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'taskList': taskList,
      },
    );

    return PendingTaskCount.fromJson(jsonResponse.body);
  }

  /// Deprecates the specified <i>activity type</i>. After an activity type has
  /// been deprecated, you cannot create new tasks of that activity type. Tasks
  /// of this type that were scheduled before the type was deprecated continue
  /// to run.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>activityType.name</code>: String constraint. The key is
  /// <code>swf:activityType.name</code>.
  /// </li>
  /// <li>
  /// <code>activityType.version</code>: String constraint. The key is
  /// <code>swf:activityType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [TypeDeprecatedFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [activityType] :
  /// The activity type to deprecate.
  ///
  /// Parameter [domain] :
  /// The name of the domain in which the activity type is registered.
  Future<void> deprecateActivityType({
    @_s.required ActivityType activityType,
    @_s.required String domain,
  }) async {
    ArgumentError.checkNotNull(activityType, 'activityType');
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DeprecateActivityType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'activityType': activityType,
        'domain': domain,
      },
    );
  }

  /// Deprecates the specified domain. After a domain has been deprecated it
  /// cannot be used to create new workflow executions or register new types.
  /// However, you can still use visibility actions on this domain. Deprecating
  /// a domain also deprecates all activity and workflow types registered in the
  /// domain. Executions that were started before the domain was deprecated
  /// continues to run.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [DomainDeprecatedFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [name] :
  /// The name of the domain to deprecate.
  Future<void> deprecateDomain({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DeprecateDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );
  }

  /// Deprecates the specified <i>workflow type</i>. After a workflow type has
  /// been deprecated, you cannot create new executions of that type. Executions
  /// that were started before the type was deprecated continues to run. A
  /// deprecated workflow type may still be used when calling visibility
  /// actions.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>workflowType.name</code>: String constraint. The key is
  /// <code>swf:workflowType.name</code>.
  /// </li>
  /// <li>
  /// <code>workflowType.version</code>: String constraint. The key is
  /// <code>swf:workflowType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [TypeDeprecatedFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which the workflow type is registered.
  ///
  /// Parameter [workflowType] :
  /// The workflow type to deprecate.
  Future<void> deprecateWorkflowType({
    @_s.required String domain,
    @_s.required WorkflowType workflowType,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workflowType, 'workflowType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DeprecateWorkflowType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'workflowType': workflowType,
      },
    );
  }

  /// Returns information about the specified activity type. This includes
  /// configuration settings provided when the type was registered and other
  /// general information about the type.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>activityType.name</code>: String constraint. The key is
  /// <code>swf:activityType.name</code>.
  /// </li>
  /// <li>
  /// <code>activityType.version</code>: String constraint. The key is
  /// <code>swf:activityType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [activityType] :
  /// The activity type to get information about. Activity types are identified
  /// by the <code>name</code> and <code>version</code> that were supplied when
  /// the activity was registered.
  ///
  /// Parameter [domain] :
  /// The name of the domain in which the activity type is registered.
  Future<ActivityTypeDetail> describeActivityType({
    @_s.required ActivityType activityType,
    @_s.required String domain,
  }) async {
    ArgumentError.checkNotNull(activityType, 'activityType');
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DescribeActivityType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'activityType': activityType,
        'domain': domain,
      },
    );

    return ActivityTypeDetail.fromJson(jsonResponse.body);
  }

  /// Returns information about the specified domain, including description and
  /// status.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [name] :
  /// The name of the domain to describe.
  Future<DomainDetail> describeDomain({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DescribeDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DomainDetail.fromJson(jsonResponse.body);
  }

  /// Returns information about the specified workflow execution including its
  /// type and some statistics.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the workflow execution.
  ///
  /// Parameter [execution] :
  /// The workflow execution to describe.
  Future<WorkflowExecutionDetail> describeWorkflowExecution({
    @_s.required String domain,
    @_s.required WorkflowExecution execution,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(execution, 'execution');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DescribeWorkflowExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'execution': execution,
      },
    );

    return WorkflowExecutionDetail.fromJson(jsonResponse.body);
  }

  /// Returns information about the specified <i>workflow type</i>. This
  /// includes configuration settings specified when the type was registered and
  /// other information such as creation date, current status, etc.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>workflowType.name</code>: String constraint. The key is
  /// <code>swf:workflowType.name</code>.
  /// </li>
  /// <li>
  /// <code>workflowType.version</code>: String constraint. The key is
  /// <code>swf:workflowType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which this workflow type is registered.
  ///
  /// Parameter [workflowType] :
  /// The workflow type to describe.
  Future<WorkflowTypeDetail> describeWorkflowType({
    @_s.required String domain,
    @_s.required WorkflowType workflowType,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workflowType, 'workflowType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DescribeWorkflowType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'workflowType': workflowType,
      },
    );

    return WorkflowTypeDetail.fromJson(jsonResponse.body);
  }

  /// Returns the history of the specified workflow execution. The results may
  /// be split into multiple pages. To retrieve subsequent pages, make the call
  /// again using the <code>nextPageToken</code> returned by the initial call.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the workflow execution.
  ///
  /// Parameter [execution] :
  /// Specifies the workflow execution for which to return the history.
  ///
  /// Parameter [maximumPageSize] :
  /// The maximum number of results that are returned per call. Use
  /// <code>nextPageToken</code> to obtain further pages of results.
  ///
  /// Parameter [nextPageToken] :
  /// If <code>NextPageToken</code> is returned there are more results
  /// available. The value of <code>NextPageToken</code> is a unique pagination
  /// token for each page. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 60 seconds. Using an expired pagination
  /// token will return a <code>400</code> error: "<code>Specified token has
  /// exceeded its maximum lifetime</code>".
  ///
  /// The configured <code>maximumPageSize</code> determines how many results
  /// can be returned in a single call.
  ///
  /// Parameter [reverseOrder] :
  /// When set to <code>true</code>, returns the events in reverse order. By
  /// default the results are returned in ascending order of the
  /// <code>eventTimeStamp</code> of the events.
  Future<History> getWorkflowExecutionHistory({
    @_s.required String domain,
    @_s.required WorkflowExecution execution,
    int maximumPageSize,
    String nextPageToken,
    bool reverseOrder,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(execution, 'execution');
    _s.validateNumRange(
      'maximumPageSize',
      maximumPageSize,
      0,
      1000,
    );
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.GetWorkflowExecutionHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'execution': execution,
        'maximumPageSize': maximumPageSize,
        'nextPageToken': nextPageToken,
        'reverseOrder': reverseOrder,
      },
    );

    return History.fromJson(jsonResponse.body);
  }

  /// Returns information about all activities registered in the specified
  /// domain that match the specified name and registration status. The result
  /// includes information like creation date, current status of the activity,
  /// etc. The results may be split into multiple pages. To retrieve subsequent
  /// pages, make the call again using the <code>nextPageToken</code> returned
  /// by the initial call.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [OperationNotPermittedFault].
  /// May throw [UnknownResourceFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which the activity types have been registered.
  ///
  /// Parameter [registrationStatus] :
  /// Specifies the registration status of the activity types to list.
  ///
  /// Parameter [maximumPageSize] :
  /// The maximum number of results that are returned per call. Use
  /// <code>nextPageToken</code> to obtain further pages of results.
  ///
  /// Parameter [name] :
  /// If specified, only lists the activity types that have this name.
  ///
  /// Parameter [nextPageToken] :
  /// If <code>NextPageToken</code> is returned there are more results
  /// available. The value of <code>NextPageToken</code> is a unique pagination
  /// token for each page. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 60 seconds. Using an expired pagination
  /// token will return a <code>400</code> error: "<code>Specified token has
  /// exceeded its maximum lifetime</code>".
  ///
  /// The configured <code>maximumPageSize</code> determines how many results
  /// can be returned in a single call.
  ///
  /// Parameter [reverseOrder] :
  /// When set to <code>true</code>, returns the results in reverse order. By
  /// default, the results are returned in ascending alphabetical order by
  /// <code>name</code> of the activity types.
  Future<ActivityTypeInfos> listActivityTypes({
    @_s.required String domain,
    @_s.required RegistrationStatus registrationStatus,
    int maximumPageSize,
    String name,
    String nextPageToken,
    bool reverseOrder,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(registrationStatus, 'registrationStatus');
    _s.validateNumRange(
      'maximumPageSize',
      maximumPageSize,
      0,
      1000,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.ListActivityTypes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'registrationStatus': registrationStatus?.toValue(),
        'maximumPageSize': maximumPageSize,
        'name': name,
        'nextPageToken': nextPageToken,
        'reverseOrder': reverseOrder,
      },
    );

    return ActivityTypeInfos.fromJson(jsonResponse.body);
  }

  /// Returns a list of closed workflow executions in the specified domain that
  /// meet the filtering criteria. The results may be split into multiple pages.
  /// To retrieve subsequent pages, make the call again using the nextPageToken
  /// returned by the initial call.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>tagFilter.tag</code>: String constraint. The key is
  /// <code>swf:tagFilter.tag</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.name</code>: String constraint. The key is
  /// <code>swf:typeFilter.name</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.version</code>: String constraint. The key is
  /// <code>swf:typeFilter.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the workflow executions to list.
  ///
  /// Parameter [closeStatusFilter] :
  /// If specified, only workflow executions that match this <i>close status</i>
  /// are listed. For example, if TERMINATED is specified, then only TERMINATED
  /// workflow executions are listed.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  ///
  /// Parameter [closeTimeFilter] :
  /// If specified, the workflow executions are included in the returned results
  /// based on whether their close times are within the range specified by this
  /// filter. Also, if this parameter is specified, the returned results are
  /// ordered by their close times.
  /// <note>
  /// <code>startTimeFilter</code> and <code>closeTimeFilter</code> are mutually
  /// exclusive. You must specify one of these in a request but not both.
  /// </note>
  ///
  /// Parameter [executionFilter] :
  /// If specified, only workflow executions matching the workflow ID specified
  /// in the filter are returned.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  ///
  /// Parameter [maximumPageSize] :
  /// The maximum number of results that are returned per call. Use
  /// <code>nextPageToken</code> to obtain further pages of results.
  ///
  /// Parameter [nextPageToken] :
  /// If <code>NextPageToken</code> is returned there are more results
  /// available. The value of <code>NextPageToken</code> is a unique pagination
  /// token for each page. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 60 seconds. Using an expired pagination
  /// token will return a <code>400</code> error: "<code>Specified token has
  /// exceeded its maximum lifetime</code>".
  ///
  /// The configured <code>maximumPageSize</code> determines how many results
  /// can be returned in a single call.
  ///
  /// Parameter [reverseOrder] :
  /// When set to <code>true</code>, returns the results in reverse order. By
  /// default the results are returned in descending order of the start or the
  /// close time of the executions.
  ///
  /// Parameter [startTimeFilter] :
  /// If specified, the workflow executions are included in the returned results
  /// based on whether their start times are within the range specified by this
  /// filter. Also, if this parameter is specified, the returned results are
  /// ordered by their start times.
  /// <note>
  /// <code>startTimeFilter</code> and <code>closeTimeFilter</code> are mutually
  /// exclusive. You must specify one of these in a request but not both.
  /// </note>
  ///
  /// Parameter [tagFilter] :
  /// If specified, only executions that have the matching tag are listed.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  ///
  /// Parameter [typeFilter] :
  /// If specified, only executions of the type specified in the filter are
  /// returned.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  Future<WorkflowExecutionInfos> listClosedWorkflowExecutions({
    @_s.required String domain,
    CloseStatusFilter closeStatusFilter,
    ExecutionTimeFilter closeTimeFilter,
    WorkflowExecutionFilter executionFilter,
    int maximumPageSize,
    String nextPageToken,
    bool reverseOrder,
    ExecutionTimeFilter startTimeFilter,
    TagFilter tagFilter,
    WorkflowTypeFilter typeFilter,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    _s.validateNumRange(
      'maximumPageSize',
      maximumPageSize,
      0,
      1000,
    );
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.ListClosedWorkflowExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'closeStatusFilter': closeStatusFilter,
        'closeTimeFilter': closeTimeFilter,
        'executionFilter': executionFilter,
        'maximumPageSize': maximumPageSize,
        'nextPageToken': nextPageToken,
        'reverseOrder': reverseOrder,
        'startTimeFilter': startTimeFilter,
        'tagFilter': tagFilter,
        'typeFilter': typeFilter,
      },
    );

    return WorkflowExecutionInfos.fromJson(jsonResponse.body);
  }

  /// Returns the list of domains registered in the account. The results may be
  /// split into multiple pages. To retrieve subsequent pages, make the call
  /// again using the nextPageToken returned by the initial call.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains. The element must be set to
  /// <code>arn:aws:swf::AccountID:domain/*</code>, where <i>AccountID</i> is
  /// the account ID, with no dashes.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [registrationStatus] :
  /// Specifies the registration status of the domains to list.
  ///
  /// Parameter [maximumPageSize] :
  /// The maximum number of results that are returned per call. Use
  /// <code>nextPageToken</code> to obtain further pages of results.
  ///
  /// Parameter [nextPageToken] :
  /// If <code>NextPageToken</code> is returned there are more results
  /// available. The value of <code>NextPageToken</code> is a unique pagination
  /// token for each page. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 60 seconds. Using an expired pagination
  /// token will return a <code>400</code> error: "<code>Specified token has
  /// exceeded its maximum lifetime</code>".
  ///
  /// The configured <code>maximumPageSize</code> determines how many results
  /// can be returned in a single call.
  ///
  /// Parameter [reverseOrder] :
  /// When set to <code>true</code>, returns the results in reverse order. By
  /// default, the results are returned in ascending alphabetical order by
  /// <code>name</code> of the domains.
  Future<DomainInfos> listDomains({
    @_s.required RegistrationStatus registrationStatus,
    int maximumPageSize,
    String nextPageToken,
    bool reverseOrder,
  }) async {
    ArgumentError.checkNotNull(registrationStatus, 'registrationStatus');
    _s.validateNumRange(
      'maximumPageSize',
      maximumPageSize,
      0,
      1000,
    );
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.ListDomains'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'registrationStatus': registrationStatus?.toValue(),
        'maximumPageSize': maximumPageSize,
        'nextPageToken': nextPageToken,
        'reverseOrder': reverseOrder,
      },
    );

    return DomainInfos.fromJson(jsonResponse.body);
  }

  /// Returns a list of open workflow executions in the specified domain that
  /// meet the filtering criteria. The results may be split into multiple pages.
  /// To retrieve subsequent pages, make the call again using the nextPageToken
  /// returned by the initial call.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>tagFilter.tag</code>: String constraint. The key is
  /// <code>swf:tagFilter.tag</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.name</code>: String constraint. The key is
  /// <code>swf:typeFilter.name</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.version</code>: String constraint. The key is
  /// <code>swf:typeFilter.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the workflow executions to list.
  ///
  /// Parameter [startTimeFilter] :
  /// Workflow executions are included in the returned results based on whether
  /// their start times are within the range specified by this filter.
  ///
  /// Parameter [executionFilter] :
  /// If specified, only workflow executions matching the workflow ID specified
  /// in the filter are returned.
  /// <note>
  /// <code>executionFilter</code>, <code>typeFilter</code> and
  /// <code>tagFilter</code> are mutually exclusive. You can specify at most one
  /// of these in a request.
  /// </note>
  ///
  /// Parameter [maximumPageSize] :
  /// The maximum number of results that are returned per call. Use
  /// <code>nextPageToken</code> to obtain further pages of results.
  ///
  /// Parameter [nextPageToken] :
  /// If <code>NextPageToken</code> is returned there are more results
  /// available. The value of <code>NextPageToken</code> is a unique pagination
  /// token for each page. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 60 seconds. Using an expired pagination
  /// token will return a <code>400</code> error: "<code>Specified token has
  /// exceeded its maximum lifetime</code>".
  ///
  /// The configured <code>maximumPageSize</code> determines how many results
  /// can be returned in a single call.
  ///
  /// Parameter [reverseOrder] :
  /// When set to <code>true</code>, returns the results in reverse order. By
  /// default the results are returned in descending order of the start time of
  /// the executions.
  ///
  /// Parameter [tagFilter] :
  /// If specified, only executions that have the matching tag are listed.
  /// <note>
  /// <code>executionFilter</code>, <code>typeFilter</code> and
  /// <code>tagFilter</code> are mutually exclusive. You can specify at most one
  /// of these in a request.
  /// </note>
  ///
  /// Parameter [typeFilter] :
  /// If specified, only executions of the type specified in the filter are
  /// returned.
  /// <note>
  /// <code>executionFilter</code>, <code>typeFilter</code> and
  /// <code>tagFilter</code> are mutually exclusive. You can specify at most one
  /// of these in a request.
  /// </note>
  Future<WorkflowExecutionInfos> listOpenWorkflowExecutions({
    @_s.required String domain,
    @_s.required ExecutionTimeFilter startTimeFilter,
    WorkflowExecutionFilter executionFilter,
    int maximumPageSize,
    String nextPageToken,
    bool reverseOrder,
    TagFilter tagFilter,
    WorkflowTypeFilter typeFilter,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(startTimeFilter, 'startTimeFilter');
    _s.validateNumRange(
      'maximumPageSize',
      maximumPageSize,
      0,
      1000,
    );
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.ListOpenWorkflowExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'startTimeFilter': startTimeFilter,
        'executionFilter': executionFilter,
        'maximumPageSize': maximumPageSize,
        'nextPageToken': nextPageToken,
        'reverseOrder': reverseOrder,
        'tagFilter': tagFilter,
        'typeFilter': typeFilter,
      },
    );

    return WorkflowExecutionInfos.fromJson(jsonResponse.body);
  }

  /// List tags for a given domain.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [LimitExceededFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the Amazon SWF domain.
  Future<ListTagsForResourceOutput> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1600,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return ListTagsForResourceOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about workflow types in the specified domain. The
  /// results may be split into multiple pages that can be retrieved by making
  /// the call repeatedly.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [OperationNotPermittedFault].
  /// May throw [UnknownResourceFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which the workflow types have been registered.
  ///
  /// Parameter [registrationStatus] :
  /// Specifies the registration status of the workflow types to list.
  ///
  /// Parameter [maximumPageSize] :
  /// The maximum number of results that are returned per call. Use
  /// <code>nextPageToken</code> to obtain further pages of results.
  ///
  /// Parameter [name] :
  /// If specified, lists the workflow type with this name.
  ///
  /// Parameter [nextPageToken] :
  /// If <code>NextPageToken</code> is returned there are more results
  /// available. The value of <code>NextPageToken</code> is a unique pagination
  /// token for each page. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 60 seconds. Using an expired pagination
  /// token will return a <code>400</code> error: "<code>Specified token has
  /// exceeded its maximum lifetime</code>".
  ///
  /// The configured <code>maximumPageSize</code> determines how many results
  /// can be returned in a single call.
  ///
  /// Parameter [reverseOrder] :
  /// When set to <code>true</code>, returns the results in reverse order. By
  /// default the results are returned in ascending alphabetical order of the
  /// <code>name</code> of the workflow types.
  Future<WorkflowTypeInfos> listWorkflowTypes({
    @_s.required String domain,
    @_s.required RegistrationStatus registrationStatus,
    int maximumPageSize,
    String name,
    String nextPageToken,
    bool reverseOrder,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(registrationStatus, 'registrationStatus');
    _s.validateNumRange(
      'maximumPageSize',
      maximumPageSize,
      0,
      1000,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.ListWorkflowTypes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'registrationStatus': registrationStatus?.toValue(),
        'maximumPageSize': maximumPageSize,
        'name': name,
        'nextPageToken': nextPageToken,
        'reverseOrder': reverseOrder,
      },
    );

    return WorkflowTypeInfos.fromJson(jsonResponse.body);
  }

  /// Used by workers to get an <a>ActivityTask</a> from the specified activity
  /// <code>taskList</code>. This initiates a long poll, where the service holds
  /// the HTTP connection open and responds as soon as a task becomes available.
  /// The maximum time the service holds on to the request before responding is
  /// 60 seconds. If no task is available within 60 seconds, the poll returns an
  /// empty result. An empty result, in this context, means that an ActivityTask
  /// is returned, but that the value of taskToken is an empty string. If a task
  /// is returned, the worker should use its type to identify and process it
  /// correctly.
  /// <important>
  /// Workers should set their client side socket timeout to at least 70 seconds
  /// (10 seconds higher than the maximum time service may hold the poll
  /// request).
  /// </important>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the <code>taskList.name</code> parameter by using a
  /// <code>Condition</code> element with the <code>swf:taskList.name</code> key
  /// to allow the action to access only certain task lists.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  /// May throw [LimitExceededFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the task lists being polled.
  ///
  /// Parameter [taskList] :
  /// Specifies the task list to poll for activity tasks.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must not <i>be</i> the literal
  /// string <code>arn</code>.
  ///
  /// Parameter [identity] :
  /// Identity of the worker making the request, recorded in the
  /// <code>ActivityTaskStarted</code> event in the workflow history. This
  /// enables diagnostic tracing when problems arise. The form of this identity
  /// is user defined.
  Future<ActivityTask> pollForActivityTask({
    @_s.required String domain,
    @_s.required TaskList taskList,
    String identity,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(taskList, 'taskList');
    _s.validateStringLength(
      'identity',
      identity,
      0,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.PollForActivityTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'taskList': taskList,
        'identity': identity,
      },
    );

    return ActivityTask.fromJson(jsonResponse.body);
  }

  /// Used by deciders to get a <a>DecisionTask</a> from the specified decision
  /// <code>taskList</code>. A decision task may be returned for any open
  /// workflow execution that is using the specified task list. The task
  /// includes a paginated view of the history of the workflow execution. The
  /// decider should use the workflow type and the history to determine how to
  /// properly handle the task.
  ///
  /// This action initiates a long poll, where the service holds the HTTP
  /// connection open and responds as soon a task becomes available. If no
  /// decision task is available in the specified task list before the timeout
  /// of 60 seconds expires, an empty result is returned. An empty result, in
  /// this context, means that a DecisionTask is returned, but that the value of
  /// taskToken is an empty string.
  /// <important>
  /// Deciders should set their client side socket timeout to at least 70
  /// seconds (10 seconds higher than the timeout).
  /// </important> <important>
  /// Because the number of workflow history events for a single workflow
  /// execution might be very large, the result returned might be split up
  /// across a number of pages. To retrieve subsequent pages, make additional
  /// calls to <code>PollForDecisionTask</code> using the
  /// <code>nextPageToken</code> returned by the initial call. Note that you do
  /// <i>not</i> call <code>GetWorkflowExecutionHistory</code> with this
  /// <code>nextPageToken</code>. Instead, call <code>PollForDecisionTask</code>
  /// again.
  /// </important>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the <code>taskList.name</code> parameter by using a
  /// <code>Condition</code> element with the <code>swf:taskList.name</code> key
  /// to allow the action to access only certain task lists.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  /// May throw [LimitExceededFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the task lists to poll.
  ///
  /// Parameter [taskList] :
  /// Specifies the task list to poll for decision tasks.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must not <i>be</i> the literal
  /// string <code>arn</code>.
  ///
  /// Parameter [identity] :
  /// Identity of the decider making the request, which is recorded in the
  /// DecisionTaskStarted event in the workflow history. This enables diagnostic
  /// tracing when problems arise. The form of this identity is user defined.
  ///
  /// Parameter [maximumPageSize] :
  /// The maximum number of results that are returned per call. Use
  /// <code>nextPageToken</code> to obtain further pages of results.
  ///
  /// This is an upper limit only; the actual number of results returned per
  /// call may be fewer than the specified maximum.
  ///
  /// Parameter [nextPageToken] :
  /// If <code>NextPageToken</code> is returned there are more results
  /// available. The value of <code>NextPageToken</code> is a unique pagination
  /// token for each page. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 60 seconds. Using an expired pagination
  /// token will return a <code>400</code> error: "<code>Specified token has
  /// exceeded its maximum lifetime</code>".
  ///
  /// The configured <code>maximumPageSize</code> determines how many results
  /// can be returned in a single call.
  /// <note>
  /// The <code>nextPageToken</code> returned by this action cannot be used with
  /// <a>GetWorkflowExecutionHistory</a> to get the next page. You must call
  /// <a>PollForDecisionTask</a> again (with the <code>nextPageToken</code>) to
  /// retrieve the next page of history records. Calling
  /// <a>PollForDecisionTask</a> with a <code>nextPageToken</code> doesn't
  /// return a new decision task.
  /// </note>
  ///
  /// Parameter [reverseOrder] :
  /// When set to <code>true</code>, returns the events in reverse order. By
  /// default the results are returned in ascending order of the
  /// <code>eventTimestamp</code> of the events.
  Future<DecisionTask> pollForDecisionTask({
    @_s.required String domain,
    @_s.required TaskList taskList,
    String identity,
    int maximumPageSize,
    String nextPageToken,
    bool reverseOrder,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(taskList, 'taskList');
    _s.validateStringLength(
      'identity',
      identity,
      0,
      256,
    );
    _s.validateNumRange(
      'maximumPageSize',
      maximumPageSize,
      0,
      1000,
    );
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.PollForDecisionTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'taskList': taskList,
        'identity': identity,
        'maximumPageSize': maximumPageSize,
        'nextPageToken': nextPageToken,
        'reverseOrder': reverseOrder,
      },
    );

    return DecisionTask.fromJson(jsonResponse.body);
  }

  /// Used by activity workers to report to the service that the
  /// <a>ActivityTask</a> represented by the specified <code>taskToken</code> is
  /// still making progress. The worker can also specify details of the
  /// progress, for example percent complete, using the <code>details</code>
  /// parameter. This action can also be used by the worker as a mechanism to
  /// check if cancellation is being requested for the activity task. If a
  /// cancellation is being attempted for the specified task, then the boolean
  /// <code>cancelRequested</code> flag returned by the service is set to
  /// <code>true</code>.
  ///
  /// This action resets the <code>taskHeartbeatTimeout</code> clock. The
  /// <code>taskHeartbeatTimeout</code> is specified in
  /// <a>RegisterActivityType</a>.
  ///
  /// This action doesn't in itself create an event in the workflow execution
  /// history. However, if the task times out, the workflow execution history
  /// contains a <code>ActivityTaskTimedOut</code> event that contains the
  /// information from the last heartbeat generated by the activity worker.
  /// <note>
  /// The <code>taskStartToCloseTimeout</code> of an activity type is the
  /// maximum duration of an activity task, regardless of the number of
  /// <a>RecordActivityTaskHeartbeat</a> requests received. The
  /// <code>taskStartToCloseTimeout</code> is also specified in
  /// <a>RegisterActivityType</a>.
  /// </note> <note>
  /// This operation is only useful for long-lived activities to report
  /// liveliness of the task and to determine if a cancellation is being
  /// attempted.
  /// </note> <important>
  /// If the <code>cancelRequested</code> flag returns <code>true</code>, a
  /// cancellation is being attempted. If the worker can cancel the activity, it
  /// should respond with <a>RespondActivityTaskCanceled</a>. Otherwise, it
  /// should ignore the cancellation request.
  /// </important>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [taskToken] :
  /// The <code>taskToken</code> of the <a>ActivityTask</a>.
  /// <important>
  /// <code>taskToken</code> is generated by the service and should be treated
  /// as an opaque value. If the task is passed to another process, its
  /// <code>taskToken</code> must also be passed. This enables it to provide its
  /// progress and respond with results.
  /// </important>
  ///
  /// Parameter [details] :
  /// If specified, contains details about the progress of the task.
  Future<ActivityTaskStatus> recordActivityTaskHeartbeat({
    @_s.required String taskToken,
    String details,
  }) async {
    ArgumentError.checkNotNull(taskToken, 'taskToken');
    _s.validateStringLength(
      'taskToken',
      taskToken,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringLength(
      'details',
      details,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RecordActivityTaskHeartbeat'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskToken': taskToken,
        'details': details,
      },
    );

    return ActivityTaskStatus.fromJson(jsonResponse.body);
  }

  /// Registers a new <i>activity type</i> along with its configuration settings
  /// in the specified domain.
  /// <important>
  /// A <code>TypeAlreadyExists</code> fault is returned if the type already
  /// exists in the domain. You cannot change any configuration settings of the
  /// type after its registration, and it must be registered as a new version.
  /// </important>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>defaultTaskList.name</code>: String constraint. The key is
  /// <code>swf:defaultTaskList.name</code>.
  /// </li>
  /// <li>
  /// <code>name</code>: String constraint. The key is <code>swf:name</code>.
  /// </li>
  /// <li>
  /// <code>version</code>: String constraint. The key is
  /// <code>swf:version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [TypeAlreadyExistsFault].
  /// May throw [LimitExceededFault].
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which this activity is to be registered.
  ///
  /// Parameter [name] :
  /// The name of the activity type within the domain.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must not <i>be</i> the literal
  /// string <code>arn</code>.
  ///
  /// Parameter [version] :
  /// The version of the activity type.
  /// <note>
  /// The activity type consists of the name and version, the combination of
  /// which must be unique within the domain.
  /// </note>
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must not <i>be</i> the literal
  /// string <code>arn</code>.
  ///
  /// Parameter [defaultTaskHeartbeatTimeout] :
  /// If set, specifies the default maximum time before which a worker
  /// processing a task of this type must report progress by calling
  /// <a>RecordActivityTaskHeartbeat</a>. If the timeout is exceeded, the
  /// activity task is automatically timed out. This default can be overridden
  /// when scheduling an activity task using the
  /// <code>ScheduleActivityTask</code> <a>Decision</a>. If the activity worker
  /// subsequently attempts to record a heartbeat or returns a result, the
  /// activity worker receives an <code>UnknownResource</code> fault. In this
  /// case, Amazon SWF no longer considers the activity task to be valid; the
  /// activity worker should clean up the activity task.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited
  /// duration.
  ///
  /// Parameter [defaultTaskList] :
  /// If set, specifies the default task list to use for scheduling tasks of
  /// this activity type. This default task list is used if a task list isn't
  /// provided when a task is scheduled through the
  /// <code>ScheduleActivityTask</code> <a>Decision</a>.
  ///
  /// Parameter [defaultTaskPriority] :
  /// The default task priority to assign to the activity type. If not assigned,
  /// then <code>0</code> is used. Valid values are integers that range from
  /// Java's <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate
  /// higher priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>in the <i>Amazon SWF Developer Guide</i>.</i>.
  ///
  /// Parameter [defaultTaskScheduleToCloseTimeout] :
  /// If set, specifies the default maximum duration for a task of this activity
  /// type. This default can be overridden when scheduling an activity task
  /// using the <code>ScheduleActivityTask</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited
  /// duration.
  ///
  /// Parameter [defaultTaskScheduleToStartTimeout] :
  /// If set, specifies the default maximum duration that a task of this
  /// activity type can wait before being assigned to a worker. This default can
  /// be overridden when scheduling an activity task using the
  /// <code>ScheduleActivityTask</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited
  /// duration.
  ///
  /// Parameter [defaultTaskStartToCloseTimeout] :
  /// If set, specifies the default maximum duration that a worker can take to
  /// process tasks of this activity type. This default can be overridden when
  /// scheduling an activity task using the <code>ScheduleActivityTask</code>
  /// <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited
  /// duration.
  ///
  /// Parameter [description] :
  /// A textual description of the activity type.
  Future<void> registerActivityType({
    @_s.required String domain,
    @_s.required String name,
    @_s.required String version,
    String defaultTaskHeartbeatTimeout,
    TaskList defaultTaskList,
    String defaultTaskPriority,
    String defaultTaskScheduleToCloseTimeout,
    String defaultTaskScheduleToStartTimeout,
    String defaultTaskStartToCloseTimeout,
    String description,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(version, 'version');
    _s.validateStringLength(
      'version',
      version,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'defaultTaskHeartbeatTimeout',
      defaultTaskHeartbeatTimeout,
      0,
      8,
    );
    _s.validateStringLength(
      'defaultTaskScheduleToCloseTimeout',
      defaultTaskScheduleToCloseTimeout,
      0,
      8,
    );
    _s.validateStringLength(
      'defaultTaskScheduleToStartTimeout',
      defaultTaskScheduleToStartTimeout,
      0,
      8,
    );
    _s.validateStringLength(
      'defaultTaskStartToCloseTimeout',
      defaultTaskStartToCloseTimeout,
      0,
      8,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RegisterActivityType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'name': name,
        'version': version,
        'defaultTaskHeartbeatTimeout': defaultTaskHeartbeatTimeout,
        'defaultTaskList': defaultTaskList,
        'defaultTaskPriority': defaultTaskPriority,
        'defaultTaskScheduleToCloseTimeout': defaultTaskScheduleToCloseTimeout,
        'defaultTaskScheduleToStartTimeout': defaultTaskScheduleToStartTimeout,
        'defaultTaskStartToCloseTimeout': defaultTaskStartToCloseTimeout,
        'description': description,
      },
    );
  }

  /// Registers a new domain.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// You cannot use an IAM policy to control domain access for this action. The
  /// name of the domain being registered is available as the resource of this
  /// action.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [DomainAlreadyExistsFault].
  /// May throw [LimitExceededFault].
  /// May throw [OperationNotPermittedFault].
  /// May throw [TooManyTagsFault].
  ///
  /// Parameter [name] :
  /// Name of the domain to register. The name must be unique in the region that
  /// the domain is registered in.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must not <i>be</i> the literal
  /// string <code>arn</code>.
  ///
  /// Parameter [workflowExecutionRetentionPeriodInDays] :
  /// The duration (in days) that records and histories of workflow executions
  /// on the domain should be kept by the service. After the retention period,
  /// the workflow execution isn't available in the results of visibility calls.
  ///
  /// If you pass the value <code>NONE</code> or <code>0</code> (zero), then the
  /// workflow execution history isn't retained. As soon as the workflow
  /// execution completes, the execution record and its history are deleted.
  ///
  /// The maximum workflow execution retention period is 90 days. For more
  /// information about Amazon SWF service limits, see: <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-limits.html">Amazon
  /// SWF Service Limits</a> in the <i>Amazon SWF Developer Guide</i>.
  ///
  /// Parameter [description] :
  /// A text description of the domain.
  ///
  /// Parameter [tags] :
  /// Tags to be added when registering a domain.
  ///
  /// Tags may only contain unicode letters, digits, whitespace, or these
  /// symbols: <code>_ . : / = + - @</code>.
  Future<void> registerDomain({
    @_s.required String name,
    @_s.required String workflowExecutionRetentionPeriodInDays,
    String description,
    List<ResourceTag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workflowExecutionRetentionPeriodInDays,
        'workflowExecutionRetentionPeriodInDays');
    _s.validateStringLength(
      'workflowExecutionRetentionPeriodInDays',
      workflowExecutionRetentionPeriodInDays,
      1,
      8,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RegisterDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'workflowExecutionRetentionPeriodInDays':
            workflowExecutionRetentionPeriodInDays,
        'description': description,
        'tags': tags,
      },
    );
  }

  /// Registers a new <i>workflow type</i> and its configuration settings in the
  /// specified domain.
  ///
  /// The retention period for the workflow history is set by the
  /// <a>RegisterDomain</a> action.
  /// <important>
  /// If the type already exists, then a <code>TypeAlreadyExists</code> fault is
  /// returned. You cannot change the configuration settings of a workflow type
  /// once it is registered and it must be registered as a new version.
  /// </important>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>defaultTaskList.name</code>: String constraint. The key is
  /// <code>swf:defaultTaskList.name</code>.
  /// </li>
  /// <li>
  /// <code>name</code>: String constraint. The key is <code>swf:name</code>.
  /// </li>
  /// <li>
  /// <code>version</code>: String constraint. The key is
  /// <code>swf:version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [TypeAlreadyExistsFault].
  /// May throw [LimitExceededFault].
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which to register the workflow type.
  ///
  /// Parameter [name] :
  /// The name of the workflow type.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must not <i>be</i> the literal
  /// string <code>arn</code>.
  ///
  /// Parameter [version] :
  /// The version of the workflow type.
  /// <note>
  /// The workflow type consists of the name and version, the combination of
  /// which must be unique within the domain. To get a list of all currently
  /// registered workflow types, use the <a>ListWorkflowTypes</a> action.
  /// </note>
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must not <i>be</i> the literal
  /// string <code>arn</code>.
  ///
  /// Parameter [defaultChildPolicy] :
  /// If set, specifies the default policy to use for the child workflow
  /// executions when a workflow execution of this type is terminated, by
  /// calling the <a>TerminateWorkflowExecution</a> action explicitly or due to
  /// an expired timeout. This default can be overridden when starting a
  /// workflow execution using the <a>StartWorkflowExecution</a> action or the
  /// <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a
  /// <code>WorkflowExecutionCancelRequested</code> event in its history. It is
  /// up to the decider to take appropriate actions when it receives an
  /// execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue
  /// to run.
  /// </li>
  /// </ul>
  ///
  /// Parameter [defaultExecutionStartToCloseTimeout] :
  /// If set, specifies the default maximum duration for executions of this
  /// workflow type. You can override this default when starting an execution
  /// through the <a>StartWorkflowExecution</a> Action or
  /// <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds; an integer greater than or equal to
  /// 0. Unlike some of the other timeout parameters in Amazon SWF, you cannot
  /// specify a value of "NONE" for
  /// <code>defaultExecutionStartToCloseTimeout</code>; there is a one-year max
  /// limit on the time that a workflow execution can run. Exceeding this limit
  /// always causes the workflow execution to time out.
  ///
  /// Parameter [defaultLambdaRole] :
  /// The default IAM role attached to this workflow type.
  /// <note>
  /// Executions of this workflow type need IAM roles to invoke Lambda
  /// functions. If you don't specify an IAM role when you start this workflow
  /// type, the default Lambda role is attached to the execution. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html">https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html</a>
  /// in the <i>Amazon SWF Developer Guide</i>.
  /// </note>
  ///
  /// Parameter [defaultTaskList] :
  /// If set, specifies the default task list to use for scheduling decision
  /// tasks for executions of this workflow type. This default is used only if a
  /// task list isn't provided when starting the execution through the
  /// <a>StartWorkflowExecution</a> Action or
  /// <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  ///
  /// Parameter [defaultTaskPriority] :
  /// The default task priority to assign to the workflow type. If not assigned,
  /// then <code>0</code> is used. Valid values are integers that range from
  /// Java's <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate
  /// higher priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  ///
  /// Parameter [defaultTaskStartToCloseTimeout] :
  /// If set, specifies the default maximum duration of decision tasks for this
  /// workflow type. This default can be overridden when starting a workflow
  /// execution using the <a>StartWorkflowExecution</a> action or the
  /// <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited
  /// duration.
  ///
  /// Parameter [description] :
  /// Textual description of the workflow type.
  Future<void> registerWorkflowType({
    @_s.required String domain,
    @_s.required String name,
    @_s.required String version,
    ChildPolicy defaultChildPolicy,
    String defaultExecutionStartToCloseTimeout,
    String defaultLambdaRole,
    TaskList defaultTaskList,
    String defaultTaskPriority,
    String defaultTaskStartToCloseTimeout,
    String description,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(version, 'version');
    _s.validateStringLength(
      'version',
      version,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'defaultExecutionStartToCloseTimeout',
      defaultExecutionStartToCloseTimeout,
      0,
      8,
    );
    _s.validateStringLength(
      'defaultLambdaRole',
      defaultLambdaRole,
      1,
      1600,
    );
    _s.validateStringLength(
      'defaultTaskStartToCloseTimeout',
      defaultTaskStartToCloseTimeout,
      0,
      8,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RegisterWorkflowType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'name': name,
        'version': version,
        'defaultChildPolicy': defaultChildPolicy?.toValue(),
        'defaultExecutionStartToCloseTimeout':
            defaultExecutionStartToCloseTimeout,
        'defaultLambdaRole': defaultLambdaRole,
        'defaultTaskList': defaultTaskList,
        'defaultTaskPriority': defaultTaskPriority,
        'defaultTaskStartToCloseTimeout': defaultTaskStartToCloseTimeout,
        'description': description,
      },
    );
  }

  /// Records a <code>WorkflowExecutionCancelRequested</code> event in the
  /// currently running workflow execution identified by the given domain,
  /// workflowId, and runId. This logically requests the cancellation of the
  /// workflow execution as a whole. It is up to the decider to take appropriate
  /// actions when it receives an execution history with this event.
  /// <note>
  /// If the runId isn't specified, the
  /// <code>WorkflowExecutionCancelRequested</code> event is recorded in the
  /// history of the current open workflow execution with the specified
  /// workflowId in the domain.
  /// </note> <note>
  /// Because this action allows the workflow to properly clean up and
  /// gracefully close, it should be used instead of
  /// <a>TerminateWorkflowExecution</a> when possible.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the workflow execution to cancel.
  ///
  /// Parameter [workflowId] :
  /// The workflowId of the workflow execution to cancel.
  ///
  /// Parameter [runId] :
  /// The runId of the workflow execution to cancel.
  Future<void> requestCancelWorkflowExecution({
    @_s.required String domain,
    @_s.required String workflowId,
    String runId,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workflowId, 'workflowId');
    _s.validateStringLength(
      'workflowId',
      workflowId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'runId',
      runId,
      0,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RequestCancelWorkflowExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'workflowId': workflowId,
        'runId': runId,
      },
    );
  }

  /// Used by workers to tell the service that the <a>ActivityTask</a>
  /// identified by the <code>taskToken</code> was successfully canceled.
  /// Additional <code>details</code> can be provided using the
  /// <code>details</code> argument.
  ///
  /// These <code>details</code> (if provided) appear in the
  /// <code>ActivityTaskCanceled</code> event added to the workflow history.
  /// <important>
  /// Only use this operation if the <code>canceled</code> flag of a
  /// <a>RecordActivityTaskHeartbeat</a> request returns <code>true</code> and
  /// if the activity can be safely undone or abandoned.
  /// </important>
  /// A task is considered open from the time that it is scheduled until it is
  /// closed. Therefore a task is reported as open while a worker is processing
  /// it. A task is closed after it has been specified in a call to
  /// <a>RespondActivityTaskCompleted</a>, RespondActivityTaskCanceled,
  /// <a>RespondActivityTaskFailed</a>, or the task has <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types">timed
  /// out</a>.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [taskToken] :
  /// The <code>taskToken</code> of the <a>ActivityTask</a>.
  /// <important>
  /// <code>taskToken</code> is generated by the service and should be treated
  /// as an opaque value. If the task is passed to another process, its
  /// <code>taskToken</code> must also be passed. This enables it to provide its
  /// progress and respond with results.
  /// </important>
  ///
  /// Parameter [details] :
  /// Information about the cancellation.
  Future<void> respondActivityTaskCanceled({
    @_s.required String taskToken,
    String details,
  }) async {
    ArgumentError.checkNotNull(taskToken, 'taskToken');
    _s.validateStringLength(
      'taskToken',
      taskToken,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringLength(
      'details',
      details,
      0,
      32768,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RespondActivityTaskCanceled'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskToken': taskToken,
        'details': details,
      },
    );
  }

  /// Used by workers to tell the service that the <a>ActivityTask</a>
  /// identified by the <code>taskToken</code> completed successfully with a
  /// <code>result</code> (if provided). The <code>result</code> appears in the
  /// <code>ActivityTaskCompleted</code> event in the workflow history.
  /// <important>
  /// If the requested task doesn't complete successfully, use
  /// <a>RespondActivityTaskFailed</a> instead. If the worker finds that the
  /// task is canceled through the <code>canceled</code> flag returned by
  /// <a>RecordActivityTaskHeartbeat</a>, it should cancel the task, clean up
  /// and then call <a>RespondActivityTaskCanceled</a>.
  /// </important>
  /// A task is considered open from the time that it is scheduled until it is
  /// closed. Therefore a task is reported as open while a worker is processing
  /// it. A task is closed after it has been specified in a call to
  /// RespondActivityTaskCompleted, <a>RespondActivityTaskCanceled</a>,
  /// <a>RespondActivityTaskFailed</a>, or the task has <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types">timed
  /// out</a>.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [taskToken] :
  /// The <code>taskToken</code> of the <a>ActivityTask</a>.
  /// <important>
  /// <code>taskToken</code> is generated by the service and should be treated
  /// as an opaque value. If the task is passed to another process, its
  /// <code>taskToken</code> must also be passed. This enables it to provide its
  /// progress and respond with results.
  /// </important>
  ///
  /// Parameter [result] :
  /// The result of the activity task. It is a free form string that is
  /// implementation specific.
  Future<void> respondActivityTaskCompleted({
    @_s.required String taskToken,
    String result,
  }) async {
    ArgumentError.checkNotNull(taskToken, 'taskToken');
    _s.validateStringLength(
      'taskToken',
      taskToken,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringLength(
      'result',
      result,
      0,
      32768,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RespondActivityTaskCompleted'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskToken': taskToken,
        'result': result,
      },
    );
  }

  /// Used by workers to tell the service that the <a>ActivityTask</a>
  /// identified by the <code>taskToken</code> has failed with
  /// <code>reason</code> (if specified). The <code>reason</code> and
  /// <code>details</code> appear in the <code>ActivityTaskFailed</code> event
  /// added to the workflow history.
  ///
  /// A task is considered open from the time that it is scheduled until it is
  /// closed. Therefore a task is reported as open while a worker is processing
  /// it. A task is closed after it has been specified in a call to
  /// <a>RespondActivityTaskCompleted</a>, <a>RespondActivityTaskCanceled</a>,
  /// RespondActivityTaskFailed, or the task has <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types">timed
  /// out</a>.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [taskToken] :
  /// The <code>taskToken</code> of the <a>ActivityTask</a>.
  /// <important>
  /// <code>taskToken</code> is generated by the service and should be treated
  /// as an opaque value. If the task is passed to another process, its
  /// <code>taskToken</code> must also be passed. This enables it to provide its
  /// progress and respond with results.
  /// </important>
  ///
  /// Parameter [details] :
  /// Detailed information about the failure.
  ///
  /// Parameter [reason] :
  /// Description of the error that may assist in diagnostics.
  Future<void> respondActivityTaskFailed({
    @_s.required String taskToken,
    String details,
    String reason,
  }) async {
    ArgumentError.checkNotNull(taskToken, 'taskToken');
    _s.validateStringLength(
      'taskToken',
      taskToken,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringLength(
      'details',
      details,
      0,
      32768,
    );
    _s.validateStringLength(
      'reason',
      reason,
      0,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RespondActivityTaskFailed'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskToken': taskToken,
        'details': details,
        'reason': reason,
      },
    );
  }

  /// Used by deciders to tell the service that the <a>DecisionTask</a>
  /// identified by the <code>taskToken</code> has successfully completed. The
  /// <code>decisions</code> argument specifies the list of decisions made while
  /// processing the task.
  ///
  /// A <code>DecisionTaskCompleted</code> event is added to the workflow
  /// history. The <code>executionContext</code> specified is attached to the
  /// event in the workflow execution history.
  ///
  /// <b>Access Control</b>
  ///
  /// If an IAM policy grants permission to use
  /// <code>RespondDecisionTaskCompleted</code>, it can express permissions for
  /// the list of decisions in the <code>decisions</code> parameter. Each of the
  /// decisions has one or more parameters, much like a regular API call. To
  /// allow for policies to be as readable as possible, you can express
  /// permissions on decisions as if they were actual API calls, including
  /// applying conditions to some parameters. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [taskToken] :
  /// The <code>taskToken</code> from the <a>DecisionTask</a>.
  /// <important>
  /// <code>taskToken</code> is generated by the service and should be treated
  /// as an opaque value. If the task is passed to another process, its
  /// <code>taskToken</code> must also be passed. This enables it to provide its
  /// progress and respond with results.
  /// </important>
  ///
  /// Parameter [decisions] :
  /// The list of decisions (possibly empty) made by the decider while
  /// processing this decision task. See the docs for the <a>Decision</a>
  /// structure for details.
  ///
  /// Parameter [executionContext] :
  /// User defined context to add to workflow execution.
  Future<void> respondDecisionTaskCompleted({
    @_s.required String taskToken,
    List<Decision> decisions,
    String executionContext,
  }) async {
    ArgumentError.checkNotNull(taskToken, 'taskToken');
    _s.validateStringLength(
      'taskToken',
      taskToken,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringLength(
      'executionContext',
      executionContext,
      0,
      32768,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RespondDecisionTaskCompleted'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskToken': taskToken,
        'decisions': decisions,
        'executionContext': executionContext,
      },
    );
  }

  /// Records a <code>WorkflowExecutionSignaled</code> event in the workflow
  /// execution history and creates a decision task for the workflow execution
  /// identified by the given domain, workflowId and runId. The event is
  /// recorded with the specified user defined signalName and input (if
  /// provided).
  /// <note>
  /// If a runId isn't specified, then the
  /// <code>WorkflowExecutionSignaled</code> event is recorded in the history of
  /// the current open workflow with the matching workflowId in the domain.
  /// </note> <note>
  /// If the specified workflow execution isn't open, this method fails with
  /// <code>UnknownResource</code>.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the workflow execution to signal.
  ///
  /// Parameter [signalName] :
  /// The name of the signal. This name must be meaningful to the target
  /// workflow.
  ///
  /// Parameter [workflowId] :
  /// The workflowId of the workflow execution to signal.
  ///
  /// Parameter [input] :
  /// Data to attach to the <code>WorkflowExecutionSignaled</code> event in the
  /// target workflow execution's history.
  ///
  /// Parameter [runId] :
  /// The runId of the workflow execution to signal.
  Future<void> signalWorkflowExecution({
    @_s.required String domain,
    @_s.required String signalName,
    @_s.required String workflowId,
    String input,
    String runId,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(signalName, 'signalName');
    _s.validateStringLength(
      'signalName',
      signalName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workflowId, 'workflowId');
    _s.validateStringLength(
      'workflowId',
      workflowId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'input',
      input,
      0,
      32768,
    );
    _s.validateStringLength(
      'runId',
      runId,
      0,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.SignalWorkflowExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'signalName': signalName,
        'workflowId': workflowId,
        'input': input,
        'runId': runId,
      },
    );
  }

  /// Starts an execution of the workflow type in the specified domain using the
  /// provided <code>workflowId</code> and input data.
  ///
  /// This action returns the newly started workflow execution.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>tagList.member.0</code>: The key is
  /// <code>swf:tagList.member.0</code>.
  /// </li>
  /// <li>
  /// <code>tagList.member.1</code>: The key is
  /// <code>swf:tagList.member.1</code>.
  /// </li>
  /// <li>
  /// <code>tagList.member.2</code>: The key is
  /// <code>swf:tagList.member.2</code>.
  /// </li>
  /// <li>
  /// <code>tagList.member.3</code>: The key is
  /// <code>swf:tagList.member.3</code>.
  /// </li>
  /// <li>
  /// <code>tagList.member.4</code>: The key is
  /// <code>swf:tagList.member.4</code>.
  /// </li>
  /// <li>
  /// <code>taskList</code>: String constraint. The key is
  /// <code>swf:taskList.name</code>.
  /// </li>
  /// <li>
  /// <code>workflowType.name</code>: String constraint. The key is
  /// <code>swf:workflowType.name</code>.
  /// </li>
  /// <li>
  /// <code>workflowType.version</code>: String constraint. The key is
  /// <code>swf:workflowType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [TypeDeprecatedFault].
  /// May throw [WorkflowExecutionAlreadyStartedFault].
  /// May throw [LimitExceededFault].
  /// May throw [OperationNotPermittedFault].
  /// May throw [DefaultUndefinedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which the workflow execution is created.
  ///
  /// Parameter [workflowId] :
  /// The user defined identifier associated with the workflow execution. You
  /// can use this to associate a custom identifier with the workflow execution.
  /// You may specify the same identifier if a workflow execution is logically a
  /// <i>restart</i> of a previous execution. You cannot have two open workflow
  /// executions with the same <code>workflowId</code> at the same time within
  /// the same domain.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must not <i>be</i> the literal
  /// string <code>arn</code>.
  ///
  /// Parameter [workflowType] :
  /// The type of the workflow to start.
  ///
  /// Parameter [childPolicy] :
  /// If set, specifies the policy to use for the child workflow executions of
  /// this workflow execution if it is terminated, by calling the
  /// <a>TerminateWorkflowExecution</a> action explicitly or due to an expired
  /// timeout. This policy overrides the default child policy specified when
  /// registering the workflow type using <a>RegisterWorkflowType</a>.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a
  /// <code>WorkflowExecutionCancelRequested</code> event in its history. It is
  /// up to the decider to take appropriate actions when it receives an
  /// execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue
  /// to run.
  /// </li>
  /// </ul> <note>
  /// A child policy for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default child policy was specified at registration
  /// time then a fault is returned.
  /// </note>
  ///
  /// Parameter [executionStartToCloseTimeout] :
  /// The total duration for this workflow execution. This overrides the
  /// defaultExecutionStartToCloseTimeout specified when registering the
  /// workflow type.
  ///
  /// The duration is specified in seconds; an integer greater than or equal to
  /// <code>0</code>. Exceeding this limit causes the workflow execution to time
  /// out. Unlike some of the other timeout parameters in Amazon SWF, you cannot
  /// specify a value of "NONE" for this timeout; there is a one-year max limit
  /// on the time that a workflow execution can run.
  /// <note>
  /// An execution start-to-close timeout must be specified either through this
  /// parameter or as a default when the workflow type is registered. If neither
  /// this parameter nor a default execution start-to-close timeout is
  /// specified, a fault is returned.
  /// </note>
  ///
  /// Parameter [input] :
  /// The input for the workflow execution. This is a free form string which
  /// should be meaningful to the workflow you are starting. This
  /// <code>input</code> is made available to the new workflow execution in the
  /// <code>WorkflowExecutionStarted</code> history event.
  ///
  /// Parameter [lambdaRole] :
  /// The IAM role to attach to this workflow execution.
  /// <note>
  /// Executions of this workflow type need IAM roles to invoke Lambda
  /// functions. If you don't attach an IAM role, any attempt to schedule a
  /// Lambda task fails. This results in a
  /// <code>ScheduleLambdaFunctionFailed</code> history event. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html">https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html</a>
  /// in the <i>Amazon SWF Developer Guide</i>.
  /// </note>
  ///
  /// Parameter [tagList] :
  /// The list of tags to associate with the workflow execution. You can specify
  /// a maximum of 5 tags. You can list workflow executions with a specific tag
  /// by calling <a>ListOpenWorkflowExecutions</a> or
  /// <a>ListClosedWorkflowExecutions</a> and specifying a <a>TagFilter</a>.
  ///
  /// Parameter [taskList] :
  /// The task list to use for the decision tasks generated for this workflow
  /// execution. This overrides the <code>defaultTaskList</code> specified when
  /// registering the workflow type.
  /// <note>
  /// A task list for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default task list was specified at registration
  /// time then a fault is returned.
  /// </note>
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must not <i>be</i> the literal
  /// string <code>arn</code>.
  ///
  /// Parameter [taskPriority] :
  /// The task priority to use for this workflow execution. This overrides any
  /// default priority that was assigned when the workflow type was registered.
  /// If not set, then the default task priority for the workflow type is used.
  /// Valid values are integers that range from Java's
  /// <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate
  /// higher priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  ///
  /// Parameter [taskStartToCloseTimeout] :
  /// Specifies the maximum duration of decision tasks for this workflow
  /// execution. This parameter overrides the
  /// <code>defaultTaskStartToCloseTimout</code> specified when registering the
  /// workflow type using <a>RegisterWorkflowType</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited
  /// duration.
  /// <note>
  /// A task start-to-close timeout for this workflow execution must be
  /// specified either as a default for the workflow type or through this
  /// parameter. If neither this parameter is set nor a default task
  /// start-to-close timeout was specified at registration time then a fault is
  /// returned.
  /// </note>
  Future<Run> startWorkflowExecution({
    @_s.required String domain,
    @_s.required String workflowId,
    @_s.required WorkflowType workflowType,
    ChildPolicy childPolicy,
    String executionStartToCloseTimeout,
    String input,
    String lambdaRole,
    List<String> tagList,
    TaskList taskList,
    String taskPriority,
    String taskStartToCloseTimeout,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workflowId, 'workflowId');
    _s.validateStringLength(
      'workflowId',
      workflowId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workflowType, 'workflowType');
    _s.validateStringLength(
      'executionStartToCloseTimeout',
      executionStartToCloseTimeout,
      0,
      8,
    );
    _s.validateStringLength(
      'input',
      input,
      0,
      32768,
    );
    _s.validateStringLength(
      'lambdaRole',
      lambdaRole,
      1,
      1600,
    );
    _s.validateStringLength(
      'taskStartToCloseTimeout',
      taskStartToCloseTimeout,
      0,
      8,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.StartWorkflowExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'workflowId': workflowId,
        'workflowType': workflowType,
        'childPolicy': childPolicy?.toValue(),
        'executionStartToCloseTimeout': executionStartToCloseTimeout,
        'input': input,
        'lambdaRole': lambdaRole,
        'tagList': tagList,
        'taskList': taskList,
        'taskPriority': taskPriority,
        'taskStartToCloseTimeout': taskStartToCloseTimeout,
      },
    );

    return Run.fromJson(jsonResponse.body);
  }

  /// Add a tag to a Amazon SWF domain.
  /// <note>
  /// Amazon SWF supports a maximum of 50 tags per resource.
  /// </note>
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [TooManyTagsFault].
  /// May throw [LimitExceededFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the Amazon SWF domain.
  ///
  /// Parameter [tags] :
  /// The list of tags to add to a domain.
  ///
  /// Tags may only contain unicode letters, digits, whitespace, or these
  /// symbols: <code>_ . : / = + - @</code>.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required List<ResourceTag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tags': tags,
      },
    );
  }

  /// Records a <code>WorkflowExecutionTerminated</code> event and forces
  /// closure of the workflow execution identified by the given domain, runId,
  /// and workflowId. The child policy, registered with the workflow type or
  /// specified when starting this execution, is applied to any open child
  /// workflow executions of this workflow execution.
  /// <important>
  /// If the identified workflow execution was in progress, it is terminated
  /// immediately.
  /// </important> <note>
  /// If a runId isn't specified, then the
  /// <code>WorkflowExecutionTerminated</code> event is recorded in the history
  /// of the current open workflow with the matching workflowId in the domain.
  /// </note> <note>
  /// You should consider using <a>RequestCancelWorkflowExecution</a> action
  /// instead because it allows the workflow to gracefully close while
  /// <a>TerminateWorkflowExecution</a> doesn't.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The domain of the workflow execution to terminate.
  ///
  /// Parameter [workflowId] :
  /// The workflowId of the workflow execution to terminate.
  ///
  /// Parameter [childPolicy] :
  /// If set, specifies the policy to use for the child workflow executions of
  /// the workflow execution being terminated. This policy overrides the child
  /// policy specified for the workflow execution at registration time or when
  /// starting the execution.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a
  /// <code>WorkflowExecutionCancelRequested</code> event in its history. It is
  /// up to the decider to take appropriate actions when it receives an
  /// execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue
  /// to run.
  /// </li>
  /// </ul> <note>
  /// A child policy for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default child policy was specified at registration
  /// time then a fault is returned.
  /// </note>
  ///
  /// Parameter [details] :
  /// Details for terminating the workflow execution.
  ///
  /// Parameter [reason] :
  /// A descriptive reason for terminating the workflow execution.
  ///
  /// Parameter [runId] :
  /// The runId of the workflow execution to terminate.
  Future<void> terminateWorkflowExecution({
    @_s.required String domain,
    @_s.required String workflowId,
    ChildPolicy childPolicy,
    String details,
    String reason,
    String runId,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workflowId, 'workflowId');
    _s.validateStringLength(
      'workflowId',
      workflowId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'details',
      details,
      0,
      32768,
    );
    _s.validateStringLength(
      'reason',
      reason,
      0,
      256,
    );
    _s.validateStringLength(
      'runId',
      runId,
      0,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.TerminateWorkflowExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'workflowId': workflowId,
        'childPolicy': childPolicy?.toValue(),
        'details': details,
        'reason': reason,
        'runId': runId,
      },
    );
  }

  /// Undeprecates a previously deprecated <i>activity type</i>. After an
  /// activity type has been undeprecated, you can create new tasks of that
  /// activity type.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>activityType.name</code>: String constraint. The key is
  /// <code>swf:activityType.name</code>.
  /// </li>
  /// <li>
  /// <code>activityType.version</code>: String constraint. The key is
  /// <code>swf:activityType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [TypeAlreadyExistsFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [activityType] :
  /// The activity type to undeprecate.
  ///
  /// Parameter [domain] :
  /// The name of the domain of the deprecated activity type.
  Future<void> undeprecateActivityType({
    @_s.required ActivityType activityType,
    @_s.required String domain,
  }) async {
    ArgumentError.checkNotNull(activityType, 'activityType');
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.UndeprecateActivityType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'activityType': activityType,
        'domain': domain,
      },
    );
  }

  /// Undeprecates a previously deprecated domain. After a domain has been
  /// undeprecated it can be used to create new workflow executions or register
  /// new types.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [DomainAlreadyExistsFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [name] :
  /// The name of the domain of the deprecated workflow type.
  Future<void> undeprecateDomain({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.UndeprecateDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );
  }

  /// Undeprecates a previously deprecated <i>workflow type</i>. After a
  /// workflow type has been undeprecated, you can create new executions of that
  /// type.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>workflowType.name</code>: String constraint. The key is
  /// <code>swf:workflowType.name</code>.
  /// </li>
  /// <li>
  /// <code>workflowType.version</code>: String constraint. The key is
  /// <code>swf:workflowType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [TypeAlreadyExistsFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain of the deprecated workflow type.
  ///
  /// Parameter [workflowType] :
  /// The name of the domain of the deprecated workflow type.
  Future<void> undeprecateWorkflowType({
    @_s.required String domain,
    @_s.required WorkflowType workflowType,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workflowType, 'workflowType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.UndeprecateWorkflowType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'workflowType': workflowType,
      },
    );
  }

  /// Remove a tag from a Amazon SWF domain.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [LimitExceededFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the Amazon SWF domain.
  ///
  /// Parameter [tagKeys] :
  /// The list of tags to remove from the Amazon SWF domain.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tagKeys': tagKeys,
      },
    );
  }
}

/// Unit of work sent to an activity worker.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivityTask {
  /// The unique ID of the task.
  @_s.JsonKey(name: 'activityId')
  final String activityId;

  /// The type of this activity task.
  @_s.JsonKey(name: 'activityType')
  final ActivityType activityType;

  /// The ID of the <code>ActivityTaskStarted</code> event recorded in the
  /// history.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The opaque string used as a handle on the task. This token is used by
  /// workers to communicate progress and response information back to the system
  /// about the task.
  @_s.JsonKey(name: 'taskToken')
  final String taskToken;

  /// The workflow execution that started this activity task.
  @_s.JsonKey(name: 'workflowExecution')
  final WorkflowExecution workflowExecution;

  /// The inputs provided when the activity task was scheduled. The form of the
  /// input is user defined and should be meaningful to the activity
  /// implementation.
  @_s.JsonKey(name: 'input')
  final String input;

  ActivityTask({
    @_s.required this.activityId,
    @_s.required this.activityType,
    @_s.required this.startedEventId,
    @_s.required this.taskToken,
    @_s.required this.workflowExecution,
    this.input,
  });
  factory ActivityTask.fromJson(Map<String, dynamic> json) =>
      _$ActivityTaskFromJson(json);
}

/// Provides the details of the <code>ActivityTaskCancelRequested</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivityTaskCancelRequestedEventAttributes {
  /// The unique ID of the task.
  @_s.JsonKey(name: 'activityId')
  final String activityId;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>RequestCancelActivityTask</code>
  /// decision for this cancellation request. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  ActivityTaskCancelRequestedEventAttributes({
    @_s.required this.activityId,
    @_s.required this.decisionTaskCompletedEventId,
  });
  factory ActivityTaskCancelRequestedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ActivityTaskCancelRequestedEventAttributesFromJson(json);
}

/// Provides the details of the <code>ActivityTaskCanceled</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivityTaskCanceledEventAttributes {
  /// The ID of the <code>ActivityTaskScheduled</code> event that was recorded
  /// when this activity task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'scheduledEventId')
  final int scheduledEventId;

  /// The ID of the <code>ActivityTaskStarted</code> event recorded when this
  /// activity task was started. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// Details of the cancellation.
  @_s.JsonKey(name: 'details')
  final String details;

  /// If set, contains the ID of the last <code>ActivityTaskCancelRequested</code>
  /// event recorded for this activity task. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'latestCancelRequestedEventId')
  final int latestCancelRequestedEventId;

  ActivityTaskCanceledEventAttributes({
    @_s.required this.scheduledEventId,
    @_s.required this.startedEventId,
    this.details,
    this.latestCancelRequestedEventId,
  });
  factory ActivityTaskCanceledEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ActivityTaskCanceledEventAttributesFromJson(json);
}

/// Provides the details of the <code>ActivityTaskCompleted</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivityTaskCompletedEventAttributes {
  /// The ID of the <code>ActivityTaskScheduled</code> event that was recorded
  /// when this activity task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'scheduledEventId')
  final int scheduledEventId;

  /// The ID of the <code>ActivityTaskStarted</code> event recorded when this
  /// activity task was started. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The results of the activity task.
  @_s.JsonKey(name: 'result')
  final String result;

  ActivityTaskCompletedEventAttributes({
    @_s.required this.scheduledEventId,
    @_s.required this.startedEventId,
    this.result,
  });
  factory ActivityTaskCompletedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ActivityTaskCompletedEventAttributesFromJson(json);
}

/// Provides the details of the <code>ActivityTaskFailed</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivityTaskFailedEventAttributes {
  /// The ID of the <code>ActivityTaskScheduled</code> event that was recorded
  /// when this activity task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'scheduledEventId')
  final int scheduledEventId;

  /// The ID of the <code>ActivityTaskStarted</code> event recorded when this
  /// activity task was started. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The details of the failure.
  @_s.JsonKey(name: 'details')
  final String details;

  /// The reason provided for the failure.
  @_s.JsonKey(name: 'reason')
  final String reason;

  ActivityTaskFailedEventAttributes({
    @_s.required this.scheduledEventId,
    @_s.required this.startedEventId,
    this.details,
    this.reason,
  });
  factory ActivityTaskFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ActivityTaskFailedEventAttributesFromJson(json);
}

/// Provides the details of the <code>ActivityTaskScheduled</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivityTaskScheduledEventAttributes {
  /// The unique ID of the activity task.
  @_s.JsonKey(name: 'activityId')
  final String activityId;

  /// The type of the activity task.
  @_s.JsonKey(name: 'activityType')
  final ActivityType activityType;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision that resulted in the scheduling of this activity task. This
  /// information can be useful for diagnosing problems by tracing back the chain
  /// of events leading up to this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The task list in which the activity task has been scheduled.
  @_s.JsonKey(name: 'taskList')
  final TaskList taskList;

  /// Data attached to the event that can be used by the decider in subsequent
  /// workflow tasks. This data isn't sent to the activity.
  @_s.JsonKey(name: 'control')
  final String control;

  /// The maximum time before which the worker processing this task must report
  /// progress by calling <a>RecordActivityTaskHeartbeat</a>. If the timeout is
  /// exceeded, the activity task is automatically timed out. If the worker
  /// subsequently attempts to record a heartbeat or return a result, it is
  /// ignored.
  @_s.JsonKey(name: 'heartbeatTimeout')
  final String heartbeatTimeout;

  /// The input provided to the activity task.
  @_s.JsonKey(name: 'input')
  final String input;

  /// The maximum amount of time for this activity task.
  @_s.JsonKey(name: 'scheduleToCloseTimeout')
  final String scheduleToCloseTimeout;

  /// The maximum amount of time the activity task can wait to be assigned to a
  /// worker.
  @_s.JsonKey(name: 'scheduleToStartTimeout')
  final String scheduleToStartTimeout;

  /// The maximum amount of time a worker may take to process the activity task.
  @_s.JsonKey(name: 'startToCloseTimeout')
  final String startToCloseTimeout;

  /// The priority to assign to the scheduled activity task. If set, this
  /// overrides any default priority value that was assigned when the activity
  /// type was registered.
  ///
  /// Valid values are integers that range from Java's
  /// <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate higher
  /// priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  @_s.JsonKey(name: 'taskPriority')
  final String taskPriority;

  ActivityTaskScheduledEventAttributes({
    @_s.required this.activityId,
    @_s.required this.activityType,
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.taskList,
    this.control,
    this.heartbeatTimeout,
    this.input,
    this.scheduleToCloseTimeout,
    this.scheduleToStartTimeout,
    this.startToCloseTimeout,
    this.taskPriority,
  });
  factory ActivityTaskScheduledEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ActivityTaskScheduledEventAttributesFromJson(json);
}

/// Provides the details of the <code>ActivityTaskStarted</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivityTaskStartedEventAttributes {
  /// The ID of the <code>ActivityTaskScheduled</code> event that was recorded
  /// when this activity task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'scheduledEventId')
  final int scheduledEventId;

  /// Identity of the worker that was assigned this task. This aids diagnostics
  /// when problems arise. The form of this identity is user defined.
  @_s.JsonKey(name: 'identity')
  final String identity;

  ActivityTaskStartedEventAttributes({
    @_s.required this.scheduledEventId,
    this.identity,
  });
  factory ActivityTaskStartedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ActivityTaskStartedEventAttributesFromJson(json);
}

/// Status information about an activity task.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivityTaskStatus {
  /// Set to <code>true</code> if cancellation of the task is requested.
  @_s.JsonKey(name: 'cancelRequested')
  final bool cancelRequested;

  ActivityTaskStatus({
    @_s.required this.cancelRequested,
  });
  factory ActivityTaskStatus.fromJson(Map<String, dynamic> json) =>
      _$ActivityTaskStatusFromJson(json);
}

/// Provides the details of the <code>ActivityTaskTimedOut</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivityTaskTimedOutEventAttributes {
  /// The ID of the <code>ActivityTaskScheduled</code> event that was recorded
  /// when this activity task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'scheduledEventId')
  final int scheduledEventId;

  /// The ID of the <code>ActivityTaskStarted</code> event recorded when this
  /// activity task was started. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The type of the timeout that caused this event.
  @_s.JsonKey(name: 'timeoutType')
  final ActivityTaskTimeoutType timeoutType;

  /// Contains the content of the <code>details</code> parameter for the last call
  /// made by the activity to <code>RecordActivityTaskHeartbeat</code>.
  @_s.JsonKey(name: 'details')
  final String details;

  ActivityTaskTimedOutEventAttributes({
    @_s.required this.scheduledEventId,
    @_s.required this.startedEventId,
    @_s.required this.timeoutType,
    this.details,
  });
  factory ActivityTaskTimedOutEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ActivityTaskTimedOutEventAttributesFromJson(json);
}

enum ActivityTaskTimeoutType {
  @_s.JsonValue('START_TO_CLOSE')
  startToClose,
  @_s.JsonValue('SCHEDULE_TO_START')
  scheduleToStart,
  @_s.JsonValue('SCHEDULE_TO_CLOSE')
  scheduleToClose,
  @_s.JsonValue('HEARTBEAT')
  heartbeat,
}

/// Represents an activity type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ActivityType {
  /// The name of this activity.
  /// <note>
  /// The combination of activity type name and version must be unique within a
  /// domain.
  /// </note>
  @_s.JsonKey(name: 'name')
  final String name;

  /// The version of this activity.
  /// <note>
  /// The combination of activity type name and version must be unique with in a
  /// domain.
  /// </note>
  @_s.JsonKey(name: 'version')
  final String version;

  ActivityType({
    @_s.required this.name,
    @_s.required this.version,
  });
  factory ActivityType.fromJson(Map<String, dynamic> json) =>
      _$ActivityTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityTypeToJson(this);
}

/// Configuration settings registered with the activity type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivityTypeConfiguration {
  /// The default maximum time, in seconds, before which a worker processing a
  /// task must report progress by calling <a>RecordActivityTaskHeartbeat</a>.
  ///
  /// You can specify this value only when <i>registering</i> an activity type.
  /// The registered default value can be overridden when you schedule a task
  /// through the <code>ScheduleActivityTask</code> <a>Decision</a>. If the
  /// activity worker subsequently attempts to record a heartbeat or returns a
  /// result, the activity worker receives an <code>UnknownResource</code> fault.
  /// In this case, Amazon SWF no longer considers the activity task to be valid;
  /// the activity worker should clean up the activity task.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'defaultTaskHeartbeatTimeout')
  final String defaultTaskHeartbeatTimeout;

  /// The default task list specified for this activity type at registration. This
  /// default is used if a task list isn't provided when a task is scheduled
  /// through the <code>ScheduleActivityTask</code> <a>Decision</a>. You can
  /// override the default registered task list when scheduling a task through the
  /// <code>ScheduleActivityTask</code> <a>Decision</a>.
  @_s.JsonKey(name: 'defaultTaskList')
  final TaskList defaultTaskList;

  /// The default task priority for tasks of this activity type, specified at
  /// registration. If not set, then <code>0</code> is used as the default
  /// priority. This default can be overridden when scheduling an activity task.
  ///
  /// Valid values are integers that range from Java's
  /// <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate higher
  /// priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  @_s.JsonKey(name: 'defaultTaskPriority')
  final String defaultTaskPriority;

  /// The default maximum duration, specified when registering the activity type,
  /// for tasks of this activity type. You can override this default when
  /// scheduling a task through the <code>ScheduleActivityTask</code>
  /// <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'defaultTaskScheduleToCloseTimeout')
  final String defaultTaskScheduleToCloseTimeout;

  /// The default maximum duration, specified when registering the activity type,
  /// that a task of an activity type can wait before being assigned to a worker.
  /// You can override this default when scheduling a task through the
  /// <code>ScheduleActivityTask</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'defaultTaskScheduleToStartTimeout')
  final String defaultTaskScheduleToStartTimeout;

  /// The default maximum duration for tasks of an activity type specified when
  /// registering the activity type. You can override this default when scheduling
  /// a task through the <code>ScheduleActivityTask</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'defaultTaskStartToCloseTimeout')
  final String defaultTaskStartToCloseTimeout;

  ActivityTypeConfiguration({
    this.defaultTaskHeartbeatTimeout,
    this.defaultTaskList,
    this.defaultTaskPriority,
    this.defaultTaskScheduleToCloseTimeout,
    this.defaultTaskScheduleToStartTimeout,
    this.defaultTaskStartToCloseTimeout,
  });
  factory ActivityTypeConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ActivityTypeConfigurationFromJson(json);
}

/// Detailed information about an activity type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivityTypeDetail {
  /// The configuration settings registered with the activity type.
  @_s.JsonKey(name: 'configuration')
  final ActivityTypeConfiguration configuration;

  /// General information about the activity type.
  ///
  /// The status of activity type (returned in the ActivityTypeInfo structure) can
  /// be one of the following.
  ///
  /// <ul>
  /// <li>
  /// <code>REGISTERED</code> – The type is registered and available. Workers
  /// supporting this type should be running.
  /// </li>
  /// <li>
  /// <code>DEPRECATED</code> – The type was deprecated using
  /// <a>DeprecateActivityType</a>, but is still in use. You should keep workers
  /// supporting this type running. You cannot create new tasks of this type.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'typeInfo')
  final ActivityTypeInfo typeInfo;

  ActivityTypeDetail({
    @_s.required this.configuration,
    @_s.required this.typeInfo,
  });
  factory ActivityTypeDetail.fromJson(Map<String, dynamic> json) =>
      _$ActivityTypeDetailFromJson(json);
}

/// Detailed information about an activity type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivityTypeInfo {
  /// The <a>ActivityType</a> type structure representing the activity type.
  @_s.JsonKey(name: 'activityType')
  final ActivityType activityType;

  /// The date and time this activity type was created through
  /// <a>RegisterActivityType</a>.
  @_s.JsonKey(name: 'creationDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationDate;

  /// The current status of the activity type.
  @_s.JsonKey(name: 'status')
  final RegistrationStatus status;

  /// If DEPRECATED, the date and time <a>DeprecateActivityType</a> was called.
  @_s.JsonKey(
      name: 'deprecationDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime deprecationDate;

  /// The description of the activity type provided in
  /// <a>RegisterActivityType</a>.
  @_s.JsonKey(name: 'description')
  final String description;

  ActivityTypeInfo({
    @_s.required this.activityType,
    @_s.required this.creationDate,
    @_s.required this.status,
    this.deprecationDate,
    this.description,
  });
  factory ActivityTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$ActivityTypeInfoFromJson(json);
}

/// Contains a paginated list of activity type information structures.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivityTypeInfos {
  /// List of activity type information.
  @_s.JsonKey(name: 'typeInfos')
  final List<ActivityTypeInfo> typeInfos;

  /// If a <code>NextPageToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the call
  /// again using the returned token in <code>nextPageToken</code>. Keep all other
  /// arguments unchanged.
  ///
  /// The configured <code>maximumPageSize</code> determines how many results can
  /// be returned in a single call.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  ActivityTypeInfos({
    @_s.required this.typeInfos,
    this.nextPageToken,
  });
  factory ActivityTypeInfos.fromJson(Map<String, dynamic> json) =>
      _$ActivityTypeInfosFromJson(json);
}

/// Provides the details of the <code>CancelTimer</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CancelTimerDecisionAttributes {
  /// The unique ID of the timer to cancel.
  @_s.JsonKey(name: 'timerId')
  final String timerId;

  CancelTimerDecisionAttributes({
    @_s.required this.timerId,
  });
  Map<String, dynamic> toJson() => _$CancelTimerDecisionAttributesToJson(this);
}

enum CancelTimerFailedCause {
  @_s.JsonValue('TIMER_ID_UNKNOWN')
  timerIdUnknown,
  @_s.JsonValue('OPERATION_NOT_PERMITTED')
  operationNotPermitted,
}

/// Provides the details of the <code>CancelTimerFailed</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelTimerFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'cause')
  final CancelTimerFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>CancelTimer</code> decision to
  /// cancel this timer. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The timerId provided in the <code>CancelTimer</code> decision that failed.
  @_s.JsonKey(name: 'timerId')
  final String timerId;

  CancelTimerFailedEventAttributes({
    @_s.required this.cause,
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.timerId,
  });
  factory CancelTimerFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$CancelTimerFailedEventAttributesFromJson(json);
}

/// Provides the details of the <code>CancelWorkflowExecution</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CancelWorkflowExecutionDecisionAttributes {
  /// Details of the cancellation.
  @_s.JsonKey(name: 'details')
  final String details;

  CancelWorkflowExecutionDecisionAttributes({
    this.details,
  });
  Map<String, dynamic> toJson() =>
      _$CancelWorkflowExecutionDecisionAttributesToJson(this);
}

enum CancelWorkflowExecutionFailedCause {
  @_s.JsonValue('UNHANDLED_DECISION')
  unhandledDecision,
  @_s.JsonValue('OPERATION_NOT_PERMITTED')
  operationNotPermitted,
}

/// Provides the details of the <code>CancelWorkflowExecutionFailed</code>
/// event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'cause')
  final CancelWorkflowExecutionFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>CancelWorkflowExecution</code>
  /// decision for this cancellation request. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  CancelWorkflowExecutionFailedEventAttributes({
    @_s.required this.cause,
    @_s.required this.decisionTaskCompletedEventId,
  });
  factory CancelWorkflowExecutionFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$CancelWorkflowExecutionFailedEventAttributesFromJson(json);
}

enum ChildPolicy {
  @_s.JsonValue('TERMINATE')
  terminate,
  @_s.JsonValue('REQUEST_CANCEL')
  requestCancel,
  @_s.JsonValue('ABANDON')
  abandon,
}

extension on ChildPolicy {
  String toValue() {
    switch (this) {
      case ChildPolicy.terminate:
        return 'TERMINATE';
      case ChildPolicy.requestCancel:
        return 'REQUEST_CANCEL';
      case ChildPolicy.abandon:
        return 'ABANDON';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Provide details of the <code>ChildWorkflowExecutionCanceled</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChildWorkflowExecutionCanceledEventAttributes {
  /// The ID of the <code>StartChildWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to start this child workflow execution. This information can
  /// be useful for diagnosing problems by tracing back the chain of events
  /// leading up to this event.
  @_s.JsonKey(name: 'initiatedEventId')
  final int initiatedEventId;

  /// The ID of the <code>ChildWorkflowExecutionStarted</code> event recorded when
  /// this child workflow execution was started. This information can be useful
  /// for diagnosing problems by tracing back the chain of events leading up to
  /// this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The child workflow execution that was canceled.
  @_s.JsonKey(name: 'workflowExecution')
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  @_s.JsonKey(name: 'workflowType')
  final WorkflowType workflowType;

  /// Details of the cancellation (if provided).
  @_s.JsonKey(name: 'details')
  final String details;

  ChildWorkflowExecutionCanceledEventAttributes({
    @_s.required this.initiatedEventId,
    @_s.required this.startedEventId,
    @_s.required this.workflowExecution,
    @_s.required this.workflowType,
    this.details,
  });
  factory ChildWorkflowExecutionCanceledEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ChildWorkflowExecutionCanceledEventAttributesFromJson(json);
}

/// Provides the details of the <code>ChildWorkflowExecutionCompleted</code>
/// event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChildWorkflowExecutionCompletedEventAttributes {
  /// The ID of the <code>StartChildWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to start this child workflow execution. This information can
  /// be useful for diagnosing problems by tracing back the chain of events
  /// leading up to this event.
  @_s.JsonKey(name: 'initiatedEventId')
  final int initiatedEventId;

  /// The ID of the <code>ChildWorkflowExecutionStarted</code> event recorded when
  /// this child workflow execution was started. This information can be useful
  /// for diagnosing problems by tracing back the chain of events leading up to
  /// this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The child workflow execution that was completed.
  @_s.JsonKey(name: 'workflowExecution')
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  @_s.JsonKey(name: 'workflowType')
  final WorkflowType workflowType;

  /// The result of the child workflow execution.
  @_s.JsonKey(name: 'result')
  final String result;

  ChildWorkflowExecutionCompletedEventAttributes({
    @_s.required this.initiatedEventId,
    @_s.required this.startedEventId,
    @_s.required this.workflowExecution,
    @_s.required this.workflowType,
    this.result,
  });
  factory ChildWorkflowExecutionCompletedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ChildWorkflowExecutionCompletedEventAttributesFromJson(json);
}

/// Provides the details of the <code>ChildWorkflowExecutionFailed</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChildWorkflowExecutionFailedEventAttributes {
  /// The ID of the <code>StartChildWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to start this child workflow execution. This information can
  /// be useful for diagnosing problems by tracing back the chain of events
  /// leading up to this event.
  @_s.JsonKey(name: 'initiatedEventId')
  final int initiatedEventId;

  /// The ID of the <code>ChildWorkflowExecutionStarted</code> event recorded when
  /// this child workflow execution was started. This information can be useful
  /// for diagnosing problems by tracing back the chain of events leading up to
  /// this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The child workflow execution that failed.
  @_s.JsonKey(name: 'workflowExecution')
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  @_s.JsonKey(name: 'workflowType')
  final WorkflowType workflowType;

  /// The details of the failure (if provided).
  @_s.JsonKey(name: 'details')
  final String details;

  /// The reason for the failure (if provided).
  @_s.JsonKey(name: 'reason')
  final String reason;

  ChildWorkflowExecutionFailedEventAttributes({
    @_s.required this.initiatedEventId,
    @_s.required this.startedEventId,
    @_s.required this.workflowExecution,
    @_s.required this.workflowType,
    this.details,
    this.reason,
  });
  factory ChildWorkflowExecutionFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ChildWorkflowExecutionFailedEventAttributesFromJson(json);
}

/// Provides the details of the <code>ChildWorkflowExecutionStarted</code>
/// event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChildWorkflowExecutionStartedEventAttributes {
  /// The ID of the <code>StartChildWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to start this child workflow execution. This information can
  /// be useful for diagnosing problems by tracing back the chain of events
  /// leading up to this event.
  @_s.JsonKey(name: 'initiatedEventId')
  final int initiatedEventId;

  /// The child workflow execution that was started.
  @_s.JsonKey(name: 'workflowExecution')
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  @_s.JsonKey(name: 'workflowType')
  final WorkflowType workflowType;

  ChildWorkflowExecutionStartedEventAttributes({
    @_s.required this.initiatedEventId,
    @_s.required this.workflowExecution,
    @_s.required this.workflowType,
  });
  factory ChildWorkflowExecutionStartedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ChildWorkflowExecutionStartedEventAttributesFromJson(json);
}

/// Provides the details of the <code>ChildWorkflowExecutionTerminated</code>
/// event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChildWorkflowExecutionTerminatedEventAttributes {
  /// The ID of the <code>StartChildWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to start this child workflow execution. This information can
  /// be useful for diagnosing problems by tracing back the chain of events
  /// leading up to this event.
  @_s.JsonKey(name: 'initiatedEventId')
  final int initiatedEventId;

  /// The ID of the <code>ChildWorkflowExecutionStarted</code> event recorded when
  /// this child workflow execution was started. This information can be useful
  /// for diagnosing problems by tracing back the chain of events leading up to
  /// this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The child workflow execution that was terminated.
  @_s.JsonKey(name: 'workflowExecution')
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  @_s.JsonKey(name: 'workflowType')
  final WorkflowType workflowType;

  ChildWorkflowExecutionTerminatedEventAttributes({
    @_s.required this.initiatedEventId,
    @_s.required this.startedEventId,
    @_s.required this.workflowExecution,
    @_s.required this.workflowType,
  });
  factory ChildWorkflowExecutionTerminatedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ChildWorkflowExecutionTerminatedEventAttributesFromJson(json);
}

/// Provides the details of the <code>ChildWorkflowExecutionTimedOut</code>
/// event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChildWorkflowExecutionTimedOutEventAttributes {
  /// The ID of the <code>StartChildWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to start this child workflow execution. This information can
  /// be useful for diagnosing problems by tracing back the chain of events
  /// leading up to this event.
  @_s.JsonKey(name: 'initiatedEventId')
  final int initiatedEventId;

  /// The ID of the <code>ChildWorkflowExecutionStarted</code> event recorded when
  /// this child workflow execution was started. This information can be useful
  /// for diagnosing problems by tracing back the chain of events leading up to
  /// this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The type of the timeout that caused the child workflow execution to time
  /// out.
  @_s.JsonKey(name: 'timeoutType')
  final WorkflowExecutionTimeoutType timeoutType;

  /// The child workflow execution that timed out.
  @_s.JsonKey(name: 'workflowExecution')
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  @_s.JsonKey(name: 'workflowType')
  final WorkflowType workflowType;

  ChildWorkflowExecutionTimedOutEventAttributes({
    @_s.required this.initiatedEventId,
    @_s.required this.startedEventId,
    @_s.required this.timeoutType,
    @_s.required this.workflowExecution,
    @_s.required this.workflowType,
  });
  factory ChildWorkflowExecutionTimedOutEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ChildWorkflowExecutionTimedOutEventAttributesFromJson(json);
}

enum CloseStatus {
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('CANCELED')
  canceled,
  @_s.JsonValue('TERMINATED')
  terminated,
  @_s.JsonValue('CONTINUED_AS_NEW')
  continuedAsNew,
  @_s.JsonValue('TIMED_OUT')
  timedOut,
}

/// Used to filter the closed workflow executions in visibility APIs by their
/// close status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CloseStatusFilter {
  /// The close status that must match the close status of an execution for it to
  /// meet the criteria of this filter.
  @_s.JsonKey(name: 'status')
  final CloseStatus status;

  CloseStatusFilter({
    @_s.required this.status,
  });
  Map<String, dynamic> toJson() => _$CloseStatusFilterToJson(this);
}

/// Provides the details of the <code>CompleteWorkflowExecution</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CompleteWorkflowExecutionDecisionAttributes {
  /// The result of the workflow execution. The form of the result is
  /// implementation defined.
  @_s.JsonKey(name: 'result')
  final String result;

  CompleteWorkflowExecutionDecisionAttributes({
    this.result,
  });
  Map<String, dynamic> toJson() =>
      _$CompleteWorkflowExecutionDecisionAttributesToJson(this);
}

enum CompleteWorkflowExecutionFailedCause {
  @_s.JsonValue('UNHANDLED_DECISION')
  unhandledDecision,
  @_s.JsonValue('OPERATION_NOT_PERMITTED')
  operationNotPermitted,
}

/// Provides the details of the <code>CompleteWorkflowExecutionFailed</code>
/// event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CompleteWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'cause')
  final CompleteWorkflowExecutionFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>CompleteWorkflowExecution</code>
  /// decision to complete this execution. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  CompleteWorkflowExecutionFailedEventAttributes({
    @_s.required this.cause,
    @_s.required this.decisionTaskCompletedEventId,
  });
  factory CompleteWorkflowExecutionFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$CompleteWorkflowExecutionFailedEventAttributesFromJson(json);
}

/// Provides the details of the <code>ContinueAsNewWorkflowExecution</code>
/// decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// Constrain the following parameters by using a <code>Condition</code> element
/// with the appropriate keys.
///
/// <ul>
/// <li>
/// <code>tag</code> – A tag used to identify the workflow execution
/// </li>
/// <li>
/// <code>taskList</code> – String constraint. The key is
/// <code>swf:taskList.name</code>.
/// </li>
/// <li>
/// <code>workflowType.version</code> – String constraint. The key is
/// <code>swf:workflowType.version</code>.
/// </li>
/// </ul> </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ContinueAsNewWorkflowExecutionDecisionAttributes {
  /// If set, specifies the policy to use for the child workflow executions of the
  /// new execution if it is terminated by calling the
  /// <a>TerminateWorkflowExecution</a> action explicitly or due to an expired
  /// timeout. This policy overrides the default child policy specified when
  /// registering the workflow type using <a>RegisterWorkflowType</a>.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul> <note>
  /// A child policy for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default child policy was specified at registration
  /// time then a fault is returned.
  /// </note>
  @_s.JsonKey(name: 'childPolicy')
  final ChildPolicy childPolicy;

  /// If set, specifies the total duration for this workflow execution. This
  /// overrides the <code>defaultExecutionStartToCloseTimeout</code> specified
  /// when registering the workflow type.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  /// <note>
  /// An execution start-to-close timeout for this workflow execution must be
  /// specified either as a default for the workflow type or through this field.
  /// If neither this field is set nor a default execution start-to-close timeout
  /// was specified at registration time then a fault is returned.
  /// </note>
  @_s.JsonKey(name: 'executionStartToCloseTimeout')
  final String executionStartToCloseTimeout;

  /// The input provided to the new workflow execution.
  @_s.JsonKey(name: 'input')
  final String input;

  /// The IAM role to attach to the new (continued) execution.
  @_s.JsonKey(name: 'lambdaRole')
  final String lambdaRole;

  /// The list of tags to associate with the new workflow execution. A maximum of
  /// 5 tags can be specified. You can list workflow executions with a specific
  /// tag by calling <a>ListOpenWorkflowExecutions</a> or
  /// <a>ListClosedWorkflowExecutions</a> and specifying a <a>TagFilter</a>.
  @_s.JsonKey(name: 'tagList')
  final List<String> tagList;

  /// The task list to use for the decisions of the new (continued) workflow
  /// execution.
  @_s.JsonKey(name: 'taskList')
  final TaskList taskList;

  /// The task priority that, if set, specifies the priority for the decision
  /// tasks for this workflow execution. This overrides the defaultTaskPriority
  /// specified when registering the workflow type. Valid values are integers that
  /// range from Java's <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate higher
  /// priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  @_s.JsonKey(name: 'taskPriority')
  final String taskPriority;

  /// Specifies the maximum duration of decision tasks for the new workflow
  /// execution. This parameter overrides the
  /// <code>defaultTaskStartToCloseTimout</code> specified when registering the
  /// workflow type using <a>RegisterWorkflowType</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  /// <note>
  /// A task start-to-close timeout for the new workflow execution must be
  /// specified either as a default for the workflow type or through this
  /// parameter. If neither this parameter is set nor a default task
  /// start-to-close timeout was specified at registration time then a fault is
  /// returned.
  /// </note>
  @_s.JsonKey(name: 'taskStartToCloseTimeout')
  final String taskStartToCloseTimeout;

  /// The version of the workflow to start.
  @_s.JsonKey(name: 'workflowTypeVersion')
  final String workflowTypeVersion;

  ContinueAsNewWorkflowExecutionDecisionAttributes({
    this.childPolicy,
    this.executionStartToCloseTimeout,
    this.input,
    this.lambdaRole,
    this.tagList,
    this.taskList,
    this.taskPriority,
    this.taskStartToCloseTimeout,
    this.workflowTypeVersion,
  });
  Map<String, dynamic> toJson() =>
      _$ContinueAsNewWorkflowExecutionDecisionAttributesToJson(this);
}

enum ContinueAsNewWorkflowExecutionFailedCause {
  @_s.JsonValue('UNHANDLED_DECISION')
  unhandledDecision,
  @_s.JsonValue('WORKFLOW_TYPE_DEPRECATED')
  workflowTypeDeprecated,
  @_s.JsonValue('WORKFLOW_TYPE_DOES_NOT_EXIST')
  workflowTypeDoesNotExist,
  @_s.JsonValue('DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED')
  defaultExecutionStartToCloseTimeoutUndefined,
  @_s.JsonValue('DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED')
  defaultTaskStartToCloseTimeoutUndefined,
  @_s.JsonValue('DEFAULT_TASK_LIST_UNDEFINED')
  defaultTaskListUndefined,
  @_s.JsonValue('DEFAULT_CHILD_POLICY_UNDEFINED')
  defaultChildPolicyUndefined,
  @_s.JsonValue('CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED')
  continueAsNewWorkflowExecutionRateExceeded,
  @_s.JsonValue('OPERATION_NOT_PERMITTED')
  operationNotPermitted,
}

/// Provides the details of the
/// <code>ContinueAsNewWorkflowExecutionFailed</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContinueAsNewWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'cause')
  final ContinueAsNewWorkflowExecutionFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the
  /// <code>ContinueAsNewWorkflowExecution</code> decision that started this
  /// execution. This information can be useful for diagnosing problems by tracing
  /// back the chain of events leading up to this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  ContinueAsNewWorkflowExecutionFailedEventAttributes({
    @_s.required this.cause,
    @_s.required this.decisionTaskCompletedEventId,
  });
  factory ContinueAsNewWorkflowExecutionFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ContinueAsNewWorkflowExecutionFailedEventAttributesFromJson(json);
}

/// Specifies a decision made by the decider. A decision can be one of these
/// types:
///
/// <ul>
/// <li>
/// <code>CancelTimer</code> – Cancels a previously started timer and records a
/// <code>TimerCanceled</code> event in the history.
/// </li>
/// <li>
/// <code>CancelWorkflowExecution</code> – Closes the workflow execution and
/// records a <code>WorkflowExecutionCanceled</code> event in the history.
/// </li>
/// <li>
/// <code>CompleteWorkflowExecution</code> – Closes the workflow execution and
/// records a <code>WorkflowExecutionCompleted</code> event in the history .
/// </li>
/// <li>
/// <code>ContinueAsNewWorkflowExecution</code> – Closes the workflow execution
/// and starts a new workflow execution of the same type using the same workflow
/// ID and a unique run Id. A <code>WorkflowExecutionContinuedAsNew</code> event
/// is recorded in the history.
/// </li>
/// <li>
/// <code>FailWorkflowExecution</code> – Closes the workflow execution and
/// records a <code>WorkflowExecutionFailed</code> event in the history.
/// </li>
/// <li>
/// <code>RecordMarker</code> – Records a <code>MarkerRecorded</code> event in
/// the history. Markers can be used for adding custom information in the
/// history for instance to let deciders know that they don't need to look at
/// the history beyond the marker event.
/// </li>
/// <li>
/// <code>RequestCancelActivityTask</code> – Attempts to cancel a previously
/// scheduled activity task. If the activity task was scheduled but has not been
/// assigned to a worker, then it is canceled. If the activity task was already
/// assigned to a worker, then the worker is informed that cancellation has been
/// requested in the response to <a>RecordActivityTaskHeartbeat</a>.
/// </li>
/// <li>
/// <code>RequestCancelExternalWorkflowExecution</code> – Requests that a
/// request be made to cancel the specified external workflow execution and
/// records a <code>RequestCancelExternalWorkflowExecutionInitiated</code> event
/// in the history.
/// </li>
/// <li>
/// <code>ScheduleActivityTask</code> – Schedules an activity task.
/// </li>
/// <li>
/// <code>SignalExternalWorkflowExecution</code> – Requests a signal to be
/// delivered to the specified external workflow execution and records a
/// <code>SignalExternalWorkflowExecutionInitiated</code> event in the history.
/// </li>
/// <li>
/// <code>StartChildWorkflowExecution</code> – Requests that a child workflow
/// execution be started and records a
/// <code>StartChildWorkflowExecutionInitiated</code> event in the history. The
/// child workflow execution is a separate workflow execution with its own
/// history.
/// </li>
/// <li>
/// <code>StartTimer</code> – Starts a timer for this workflow execution and
/// records a <code>TimerStarted</code> event in the history. This timer fires
/// after the specified delay and record a <code>TimerFired</code> event.
/// </li>
/// </ul>
/// <b>Access Control</b>
///
/// If you grant permission to use <code>RespondDecisionTaskCompleted</code>,
/// you can use IAM policies to express permissions for the list of decisions
/// returned by this action as if they were members of the API. Treating
/// decisions as a pseudo API maintains a uniform conceptual model and helps
/// keep policies readable. For details and example IAM policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
///
/// <b>Decision Failure</b>
///
/// Decisions can fail for several reasons
///
/// <ul>
/// <li>
/// The ordering of decisions should follow a logical flow. Some decisions might
/// not make sense in the current context of the workflow execution and
/// therefore fails.
/// </li>
/// <li>
/// A limit on your account was reached.
/// </li>
/// <li>
/// The decision lacks sufficient permissions.
/// </li>
/// </ul>
/// One of the following events might be added to the history to indicate an
/// error. The event attribute's <code>cause</code> parameter indicates the
/// cause. If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>,
/// the decision failed because it lacked sufficient permissions. For details
/// and example IAM policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
///
/// <ul>
/// <li>
/// <code>ScheduleActivityTaskFailed</code> – A
/// <code>ScheduleActivityTask</code> decision failed. This could happen if the
/// activity type specified in the decision isn't registered, is in a deprecated
/// state, or the decision isn't properly configured.
/// </li>
/// <li>
/// <code>RequestCancelActivityTaskFailed</code> – A
/// <code>RequestCancelActivityTask</code> decision failed. This could happen if
/// there is no open activity task with the specified activityId.
/// </li>
/// <li>
/// <code>StartTimerFailed</code> – A <code>StartTimer</code> decision failed.
/// This could happen if there is another open timer with the same timerId.
/// </li>
/// <li>
/// <code>CancelTimerFailed</code> – A <code>CancelTimer</code> decision failed.
/// This could happen if there is no open timer with the specified timerId.
/// </li>
/// <li>
/// <code>StartChildWorkflowExecutionFailed</code> – A
/// <code>StartChildWorkflowExecution</code> decision failed. This could happen
/// if the workflow type specified isn't registered, is deprecated, or the
/// decision isn't properly configured.
/// </li>
/// <li>
/// <code>SignalExternalWorkflowExecutionFailed</code> – A
/// <code>SignalExternalWorkflowExecution</code> decision failed. This could
/// happen if the <code>workflowID</code> specified in the decision was
/// incorrect.
/// </li>
/// <li>
/// <code>RequestCancelExternalWorkflowExecutionFailed</code> – A
/// <code>RequestCancelExternalWorkflowExecution</code> decision failed. This
/// could happen if the <code>workflowID</code> specified in the decision was
/// incorrect.
/// </li>
/// <li>
/// <code>CancelWorkflowExecutionFailed</code> – A
/// <code>CancelWorkflowExecution</code> decision failed. This could happen if
/// there is an unhandled decision task pending in the workflow execution.
/// </li>
/// <li>
/// <code>CompleteWorkflowExecutionFailed</code> – A
/// <code>CompleteWorkflowExecution</code> decision failed. This could happen if
/// there is an unhandled decision task pending in the workflow execution.
/// </li>
/// <li>
/// <code>ContinueAsNewWorkflowExecutionFailed</code> – A
/// <code>ContinueAsNewWorkflowExecution</code> decision failed. This could
/// happen if there is an unhandled decision task pending in the workflow
/// execution or the ContinueAsNewWorkflowExecution decision was not configured
/// correctly.
/// </li>
/// <li>
/// <code>FailWorkflowExecutionFailed</code> – A
/// <code>FailWorkflowExecution</code> decision failed. This could happen if
/// there is an unhandled decision task pending in the workflow execution.
/// </li>
/// </ul>
/// The preceding error events might occur due to an error in the decider logic,
/// which might put the workflow execution in an unstable state The cause field
/// in the event structure for the error event indicates the cause of the error.
/// <note>
/// A workflow execution may be closed by the decider by returning one of the
/// following decisions when completing a decision task:
/// <code>CompleteWorkflowExecution</code>, <code>FailWorkflowExecution</code>,
/// <code>CancelWorkflowExecution</code> and
/// <code>ContinueAsNewWorkflowExecution</code>. An
/// <code>UnhandledDecision</code> fault is returned if a workflow closing
/// decision is specified and a signal or activity event had been added to the
/// history while the decision task was being performed by the decider. Unlike
/// the above situations which are logic issues, this fault is always possible
/// because of race conditions in a distributed system. The right action here is
/// to call <a>RespondDecisionTaskCompleted</a> without any decisions. This
/// would result in another decision task with these new events included in the
/// history. The decider should handle the new events and may decide to close
/// the workflow execution.
/// </note>
/// <b>How to Code a Decision</b>
///
/// You code a decision by first setting the decision type field to one of the
/// above decision values, and then set the corresponding attributes field shown
/// below:
///
/// <ul>
/// <li>
/// <code> <a>ScheduleActivityTaskDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>RequestCancelActivityTaskDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>CompleteWorkflowExecutionDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>FailWorkflowExecutionDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>CancelWorkflowExecutionDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>ContinueAsNewWorkflowExecutionDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>RecordMarkerDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>StartTimerDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>CancelTimerDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>SignalExternalWorkflowExecutionDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>RequestCancelExternalWorkflowExecutionDecisionAttributes</a>
/// </code>
/// </li>
/// <li>
/// <code> <a>StartChildWorkflowExecutionDecisionAttributes</a> </code>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Decision {
  /// Specifies the type of the decision.
  @_s.JsonKey(name: 'decisionType')
  final DecisionType decisionType;

  /// Provides the details of the <code>CancelTimer</code> decision. It isn't set
  /// for other decision types.
  @_s.JsonKey(name: 'cancelTimerDecisionAttributes')
  final CancelTimerDecisionAttributes cancelTimerDecisionAttributes;

  /// Provides the details of the <code>CancelWorkflowExecution</code> decision.
  /// It isn't set for other decision types.
  @_s.JsonKey(name: 'cancelWorkflowExecutionDecisionAttributes')
  final CancelWorkflowExecutionDecisionAttributes
      cancelWorkflowExecutionDecisionAttributes;

  /// Provides the details of the <code>CompleteWorkflowExecution</code> decision.
  /// It isn't set for other decision types.
  @_s.JsonKey(name: 'completeWorkflowExecutionDecisionAttributes')
  final CompleteWorkflowExecutionDecisionAttributes
      completeWorkflowExecutionDecisionAttributes;

  /// Provides the details of the <code>ContinueAsNewWorkflowExecution</code>
  /// decision. It isn't set for other decision types.
  @_s.JsonKey(name: 'continueAsNewWorkflowExecutionDecisionAttributes')
  final ContinueAsNewWorkflowExecutionDecisionAttributes
      continueAsNewWorkflowExecutionDecisionAttributes;

  /// Provides the details of the <code>FailWorkflowExecution</code> decision. It
  /// isn't set for other decision types.
  @_s.JsonKey(name: 'failWorkflowExecutionDecisionAttributes')
  final FailWorkflowExecutionDecisionAttributes
      failWorkflowExecutionDecisionAttributes;

  /// Provides the details of the <code>RecordMarker</code> decision. It isn't set
  /// for other decision types.
  @_s.JsonKey(name: 'recordMarkerDecisionAttributes')
  final RecordMarkerDecisionAttributes recordMarkerDecisionAttributes;

  /// Provides the details of the <code>RequestCancelActivityTask</code> decision.
  /// It isn't set for other decision types.
  @_s.JsonKey(name: 'requestCancelActivityTaskDecisionAttributes')
  final RequestCancelActivityTaskDecisionAttributes
      requestCancelActivityTaskDecisionAttributes;

  /// Provides the details of the
  /// <code>RequestCancelExternalWorkflowExecution</code> decision. It isn't set
  /// for other decision types.
  @_s.JsonKey(name: 'requestCancelExternalWorkflowExecutionDecisionAttributes')
  final RequestCancelExternalWorkflowExecutionDecisionAttributes
      requestCancelExternalWorkflowExecutionDecisionAttributes;

  /// Provides the details of the <code>ScheduleActivityTask</code> decision. It
  /// isn't set for other decision types.
  @_s.JsonKey(name: 'scheduleActivityTaskDecisionAttributes')
  final ScheduleActivityTaskDecisionAttributes
      scheduleActivityTaskDecisionAttributes;

  /// Provides the details of the <code>ScheduleLambdaFunction</code> decision. It
  /// isn't set for other decision types.
  @_s.JsonKey(name: 'scheduleLambdaFunctionDecisionAttributes')
  final ScheduleLambdaFunctionDecisionAttributes
      scheduleLambdaFunctionDecisionAttributes;

  /// Provides the details of the <code>SignalExternalWorkflowExecution</code>
  /// decision. It isn't set for other decision types.
  @_s.JsonKey(name: 'signalExternalWorkflowExecutionDecisionAttributes')
  final SignalExternalWorkflowExecutionDecisionAttributes
      signalExternalWorkflowExecutionDecisionAttributes;

  /// Provides the details of the <code>StartChildWorkflowExecution</code>
  /// decision. It isn't set for other decision types.
  @_s.JsonKey(name: 'startChildWorkflowExecutionDecisionAttributes')
  final StartChildWorkflowExecutionDecisionAttributes
      startChildWorkflowExecutionDecisionAttributes;

  /// Provides the details of the <code>StartTimer</code> decision. It isn't set
  /// for other decision types.
  @_s.JsonKey(name: 'startTimerDecisionAttributes')
  final StartTimerDecisionAttributes startTimerDecisionAttributes;

  Decision({
    @_s.required this.decisionType,
    this.cancelTimerDecisionAttributes,
    this.cancelWorkflowExecutionDecisionAttributes,
    this.completeWorkflowExecutionDecisionAttributes,
    this.continueAsNewWorkflowExecutionDecisionAttributes,
    this.failWorkflowExecutionDecisionAttributes,
    this.recordMarkerDecisionAttributes,
    this.requestCancelActivityTaskDecisionAttributes,
    this.requestCancelExternalWorkflowExecutionDecisionAttributes,
    this.scheduleActivityTaskDecisionAttributes,
    this.scheduleLambdaFunctionDecisionAttributes,
    this.signalExternalWorkflowExecutionDecisionAttributes,
    this.startChildWorkflowExecutionDecisionAttributes,
    this.startTimerDecisionAttributes,
  });
  Map<String, dynamic> toJson() => _$DecisionToJson(this);
}

/// A structure that represents a decision task. Decision tasks are sent to
/// deciders in order for them to make decisions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DecisionTask {
  /// A paginated list of history events of the workflow execution. The decider
  /// uses this during the processing of the decision task.
  @_s.JsonKey(name: 'events')
  final List<HistoryEvent> events;

  /// The ID of the <code>DecisionTaskStarted</code> event recorded in the
  /// history.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The opaque string used as a handle on the task. This token is used by
  /// workers to communicate progress and response information back to the system
  /// about the task.
  @_s.JsonKey(name: 'taskToken')
  final String taskToken;

  /// The workflow execution for which this decision task was created.
  @_s.JsonKey(name: 'workflowExecution')
  final WorkflowExecution workflowExecution;

  /// The type of the workflow execution for which this decision task was created.
  @_s.JsonKey(name: 'workflowType')
  final WorkflowType workflowType;

  /// If a <code>NextPageToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the call
  /// again using the returned token in <code>nextPageToken</code>. Keep all other
  /// arguments unchanged.
  ///
  /// The configured <code>maximumPageSize</code> determines how many results can
  /// be returned in a single call.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  /// The ID of the DecisionTaskStarted event of the previous decision task of
  /// this workflow execution that was processed by the decider. This can be used
  /// to determine the events in the history new since the last decision task
  /// received by the decider.
  @_s.JsonKey(name: 'previousStartedEventId')
  final int previousStartedEventId;

  DecisionTask({
    @_s.required this.events,
    @_s.required this.startedEventId,
    @_s.required this.taskToken,
    @_s.required this.workflowExecution,
    @_s.required this.workflowType,
    this.nextPageToken,
    this.previousStartedEventId,
  });
  factory DecisionTask.fromJson(Map<String, dynamic> json) =>
      _$DecisionTaskFromJson(json);
}

/// Provides the details of the <code>DecisionTaskCompleted</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DecisionTaskCompletedEventAttributes {
  /// The ID of the <code>DecisionTaskScheduled</code> event that was recorded
  /// when this decision task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'scheduledEventId')
  final int scheduledEventId;

  /// The ID of the <code>DecisionTaskStarted</code> event recorded when this
  /// decision task was started. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// User defined context for the workflow execution.
  @_s.JsonKey(name: 'executionContext')
  final String executionContext;

  DecisionTaskCompletedEventAttributes({
    @_s.required this.scheduledEventId,
    @_s.required this.startedEventId,
    this.executionContext,
  });
  factory DecisionTaskCompletedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$DecisionTaskCompletedEventAttributesFromJson(json);
}

/// Provides details about the <code>DecisionTaskScheduled</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DecisionTaskScheduledEventAttributes {
  /// The name of the task list in which the decision task was scheduled.
  @_s.JsonKey(name: 'taskList')
  final TaskList taskList;

  /// The maximum duration for this decision task. The task is considered timed
  /// out if it doesn't completed within this duration.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'startToCloseTimeout')
  final String startToCloseTimeout;

  /// A task priority that, if set, specifies the priority for this decision task.
  /// Valid values are integers that range from Java's
  /// <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate higher
  /// priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  @_s.JsonKey(name: 'taskPriority')
  final String taskPriority;

  DecisionTaskScheduledEventAttributes({
    @_s.required this.taskList,
    this.startToCloseTimeout,
    this.taskPriority,
  });
  factory DecisionTaskScheduledEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$DecisionTaskScheduledEventAttributesFromJson(json);
}

/// Provides the details of the <code>DecisionTaskStarted</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DecisionTaskStartedEventAttributes {
  /// The ID of the <code>DecisionTaskScheduled</code> event that was recorded
  /// when this decision task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'scheduledEventId')
  final int scheduledEventId;

  /// Identity of the decider making the request. This enables diagnostic tracing
  /// when problems arise. The form of this identity is user defined.
  @_s.JsonKey(name: 'identity')
  final String identity;

  DecisionTaskStartedEventAttributes({
    @_s.required this.scheduledEventId,
    this.identity,
  });
  factory DecisionTaskStartedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$DecisionTaskStartedEventAttributesFromJson(json);
}

/// Provides the details of the <code>DecisionTaskTimedOut</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DecisionTaskTimedOutEventAttributes {
  /// The ID of the <code>DecisionTaskScheduled</code> event that was recorded
  /// when this decision task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'scheduledEventId')
  final int scheduledEventId;

  /// The ID of the <code>DecisionTaskStarted</code> event recorded when this
  /// decision task was started. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The type of timeout that expired before the decision task could be
  /// completed.
  @_s.JsonKey(name: 'timeoutType')
  final DecisionTaskTimeoutType timeoutType;

  DecisionTaskTimedOutEventAttributes({
    @_s.required this.scheduledEventId,
    @_s.required this.startedEventId,
    @_s.required this.timeoutType,
  });
  factory DecisionTaskTimedOutEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$DecisionTaskTimedOutEventAttributesFromJson(json);
}

enum DecisionTaskTimeoutType {
  @_s.JsonValue('START_TO_CLOSE')
  startToClose,
}

enum DecisionType {
  @_s.JsonValue('ScheduleActivityTask')
  scheduleActivityTask,
  @_s.JsonValue('RequestCancelActivityTask')
  requestCancelActivityTask,
  @_s.JsonValue('CompleteWorkflowExecution')
  completeWorkflowExecution,
  @_s.JsonValue('FailWorkflowExecution')
  failWorkflowExecution,
  @_s.JsonValue('CancelWorkflowExecution')
  cancelWorkflowExecution,
  @_s.JsonValue('ContinueAsNewWorkflowExecution')
  continueAsNewWorkflowExecution,
  @_s.JsonValue('RecordMarker')
  recordMarker,
  @_s.JsonValue('StartTimer')
  startTimer,
  @_s.JsonValue('CancelTimer')
  cancelTimer,
  @_s.JsonValue('SignalExternalWorkflowExecution')
  signalExternalWorkflowExecution,
  @_s.JsonValue('RequestCancelExternalWorkflowExecution')
  requestCancelExternalWorkflowExecution,
  @_s.JsonValue('StartChildWorkflowExecution')
  startChildWorkflowExecution,
  @_s.JsonValue('ScheduleLambdaFunction')
  scheduleLambdaFunction,
}

/// Contains the configuration settings of a domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainConfiguration {
  /// The retention period for workflow executions in this domain.
  @_s.JsonKey(name: 'workflowExecutionRetentionPeriodInDays')
  final String workflowExecutionRetentionPeriodInDays;

  DomainConfiguration({
    @_s.required this.workflowExecutionRetentionPeriodInDays,
  });
  factory DomainConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DomainConfigurationFromJson(json);
}

/// Contains details of a domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainDetail {
  /// The domain configuration. Currently, this includes only the domain's
  /// retention period.
  @_s.JsonKey(name: 'configuration')
  final DomainConfiguration configuration;

  /// The basic information about a domain, such as its name, status, and
  /// description.
  @_s.JsonKey(name: 'domainInfo')
  final DomainInfo domainInfo;

  DomainDetail({
    @_s.required this.configuration,
    @_s.required this.domainInfo,
  });
  factory DomainDetail.fromJson(Map<String, dynamic> json) =>
      _$DomainDetailFromJson(json);
}

/// Contains general information about a domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainInfo {
  /// The name of the domain. This name is unique within the account.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of the domain:
  ///
  /// <ul>
  /// <li>
  /// <code>REGISTERED</code> – The domain is properly registered and available.
  /// You can use this domain for registering types and creating new workflow
  /// executions.
  /// </li>
  /// <li>
  /// <code>DEPRECATED</code> – The domain was deprecated using
  /// <a>DeprecateDomain</a>, but is still in use. You should not create new
  /// workflow executions in this domain.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final RegistrationStatus status;

  /// The ARN of the domain.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The description of the domain provided through <a>RegisterDomain</a>.
  @_s.JsonKey(name: 'description')
  final String description;

  DomainInfo({
    @_s.required this.name,
    @_s.required this.status,
    this.arn,
    this.description,
  });
  factory DomainInfo.fromJson(Map<String, dynamic> json) =>
      _$DomainInfoFromJson(json);
}

/// Contains a paginated collection of DomainInfo structures.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainInfos {
  /// A list of DomainInfo structures.
  @_s.JsonKey(name: 'domainInfos')
  final List<DomainInfo> domainInfos;

  /// If a <code>NextPageToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the call
  /// again using the returned token in <code>nextPageToken</code>. Keep all other
  /// arguments unchanged.
  ///
  /// The configured <code>maximumPageSize</code> determines how many results can
  /// be returned in a single call.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  DomainInfos({
    @_s.required this.domainInfos,
    this.nextPageToken,
  });
  factory DomainInfos.fromJson(Map<String, dynamic> json) =>
      _$DomainInfosFromJson(json);
}

enum EventType {
  @_s.JsonValue('WorkflowExecutionStarted')
  workflowExecutionStarted,
  @_s.JsonValue('WorkflowExecutionCancelRequested')
  workflowExecutionCancelRequested,
  @_s.JsonValue('WorkflowExecutionCompleted')
  workflowExecutionCompleted,
  @_s.JsonValue('CompleteWorkflowExecutionFailed')
  completeWorkflowExecutionFailed,
  @_s.JsonValue('WorkflowExecutionFailed')
  workflowExecutionFailed,
  @_s.JsonValue('FailWorkflowExecutionFailed')
  failWorkflowExecutionFailed,
  @_s.JsonValue('WorkflowExecutionTimedOut')
  workflowExecutionTimedOut,
  @_s.JsonValue('WorkflowExecutionCanceled')
  workflowExecutionCanceled,
  @_s.JsonValue('CancelWorkflowExecutionFailed')
  cancelWorkflowExecutionFailed,
  @_s.JsonValue('WorkflowExecutionContinuedAsNew')
  workflowExecutionContinuedAsNew,
  @_s.JsonValue('ContinueAsNewWorkflowExecutionFailed')
  continueAsNewWorkflowExecutionFailed,
  @_s.JsonValue('WorkflowExecutionTerminated')
  workflowExecutionTerminated,
  @_s.JsonValue('DecisionTaskScheduled')
  decisionTaskScheduled,
  @_s.JsonValue('DecisionTaskStarted')
  decisionTaskStarted,
  @_s.JsonValue('DecisionTaskCompleted')
  decisionTaskCompleted,
  @_s.JsonValue('DecisionTaskTimedOut')
  decisionTaskTimedOut,
  @_s.JsonValue('ActivityTaskScheduled')
  activityTaskScheduled,
  @_s.JsonValue('ScheduleActivityTaskFailed')
  scheduleActivityTaskFailed,
  @_s.JsonValue('ActivityTaskStarted')
  activityTaskStarted,
  @_s.JsonValue('ActivityTaskCompleted')
  activityTaskCompleted,
  @_s.JsonValue('ActivityTaskFailed')
  activityTaskFailed,
  @_s.JsonValue('ActivityTaskTimedOut')
  activityTaskTimedOut,
  @_s.JsonValue('ActivityTaskCanceled')
  activityTaskCanceled,
  @_s.JsonValue('ActivityTaskCancelRequested')
  activityTaskCancelRequested,
  @_s.JsonValue('RequestCancelActivityTaskFailed')
  requestCancelActivityTaskFailed,
  @_s.JsonValue('WorkflowExecutionSignaled')
  workflowExecutionSignaled,
  @_s.JsonValue('MarkerRecorded')
  markerRecorded,
  @_s.JsonValue('RecordMarkerFailed')
  recordMarkerFailed,
  @_s.JsonValue('TimerStarted')
  timerStarted,
  @_s.JsonValue('StartTimerFailed')
  startTimerFailed,
  @_s.JsonValue('TimerFired')
  timerFired,
  @_s.JsonValue('TimerCanceled')
  timerCanceled,
  @_s.JsonValue('CancelTimerFailed')
  cancelTimerFailed,
  @_s.JsonValue('StartChildWorkflowExecutionInitiated')
  startChildWorkflowExecutionInitiated,
  @_s.JsonValue('StartChildWorkflowExecutionFailed')
  startChildWorkflowExecutionFailed,
  @_s.JsonValue('ChildWorkflowExecutionStarted')
  childWorkflowExecutionStarted,
  @_s.JsonValue('ChildWorkflowExecutionCompleted')
  childWorkflowExecutionCompleted,
  @_s.JsonValue('ChildWorkflowExecutionFailed')
  childWorkflowExecutionFailed,
  @_s.JsonValue('ChildWorkflowExecutionTimedOut')
  childWorkflowExecutionTimedOut,
  @_s.JsonValue('ChildWorkflowExecutionCanceled')
  childWorkflowExecutionCanceled,
  @_s.JsonValue('ChildWorkflowExecutionTerminated')
  childWorkflowExecutionTerminated,
  @_s.JsonValue('SignalExternalWorkflowExecutionInitiated')
  signalExternalWorkflowExecutionInitiated,
  @_s.JsonValue('SignalExternalWorkflowExecutionFailed')
  signalExternalWorkflowExecutionFailed,
  @_s.JsonValue('ExternalWorkflowExecutionSignaled')
  externalWorkflowExecutionSignaled,
  @_s.JsonValue('RequestCancelExternalWorkflowExecutionInitiated')
  requestCancelExternalWorkflowExecutionInitiated,
  @_s.JsonValue('RequestCancelExternalWorkflowExecutionFailed')
  requestCancelExternalWorkflowExecutionFailed,
  @_s.JsonValue('ExternalWorkflowExecutionCancelRequested')
  externalWorkflowExecutionCancelRequested,
  @_s.JsonValue('LambdaFunctionScheduled')
  lambdaFunctionScheduled,
  @_s.JsonValue('LambdaFunctionStarted')
  lambdaFunctionStarted,
  @_s.JsonValue('LambdaFunctionCompleted')
  lambdaFunctionCompleted,
  @_s.JsonValue('LambdaFunctionFailed')
  lambdaFunctionFailed,
  @_s.JsonValue('LambdaFunctionTimedOut')
  lambdaFunctionTimedOut,
  @_s.JsonValue('ScheduleLambdaFunctionFailed')
  scheduleLambdaFunctionFailed,
  @_s.JsonValue('StartLambdaFunctionFailed')
  startLambdaFunctionFailed,
}

enum ExecutionStatus {
  @_s.JsonValue('OPEN')
  open,
  @_s.JsonValue('CLOSED')
  closed,
}

/// Used to filter the workflow executions in visibility APIs by various
/// time-based rules. Each parameter, if specified, defines a rule that must be
/// satisfied by each returned query result. The parameter values are in the <a
/// href="https://en.wikipedia.org/wiki/Unix_time">Unix Time format</a>. For
/// example: <code>"oldestDate": 1325376070.</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ExecutionTimeFilter {
  /// Specifies the oldest start or close date and time to return.
  @_s.JsonKey(name: 'oldestDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime oldestDate;

  /// Specifies the latest start or close date and time to return.
  @_s.JsonKey(name: 'latestDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime latestDate;

  ExecutionTimeFilter({
    @_s.required this.oldestDate,
    this.latestDate,
  });
  Map<String, dynamic> toJson() => _$ExecutionTimeFilterToJson(this);
}

/// Provides the details of the
/// <code>ExternalWorkflowExecutionCancelRequested</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExternalWorkflowExecutionCancelRequestedEventAttributes {
  /// The ID of the <code>RequestCancelExternalWorkflowExecutionInitiated</code>
  /// event corresponding to the
  /// <code>RequestCancelExternalWorkflowExecution</code> decision to cancel this
  /// external workflow execution. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'initiatedEventId')
  final int initiatedEventId;

  /// The external workflow execution to which the cancellation request was
  /// delivered.
  @_s.JsonKey(name: 'workflowExecution')
  final WorkflowExecution workflowExecution;

  ExternalWorkflowExecutionCancelRequestedEventAttributes({
    @_s.required this.initiatedEventId,
    @_s.required this.workflowExecution,
  });
  factory ExternalWorkflowExecutionCancelRequestedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ExternalWorkflowExecutionCancelRequestedEventAttributesFromJson(json);
}

/// Provides the details of the <code>ExternalWorkflowExecutionSignaled</code>
/// event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExternalWorkflowExecutionSignaledEventAttributes {
  /// The ID of the <code>SignalExternalWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>SignalExternalWorkflowExecution</code> decision
  /// to request this signal. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'initiatedEventId')
  final int initiatedEventId;

  /// The external workflow execution that the signal was delivered to.
  @_s.JsonKey(name: 'workflowExecution')
  final WorkflowExecution workflowExecution;

  ExternalWorkflowExecutionSignaledEventAttributes({
    @_s.required this.initiatedEventId,
    @_s.required this.workflowExecution,
  });
  factory ExternalWorkflowExecutionSignaledEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ExternalWorkflowExecutionSignaledEventAttributesFromJson(json);
}

/// Provides the details of the <code>FailWorkflowExecution</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class FailWorkflowExecutionDecisionAttributes {
  /// Details of the failure.
  @_s.JsonKey(name: 'details')
  final String details;

  /// A descriptive reason for the failure that may help in diagnostics.
  @_s.JsonKey(name: 'reason')
  final String reason;

  FailWorkflowExecutionDecisionAttributes({
    this.details,
    this.reason,
  });
  Map<String, dynamic> toJson() =>
      _$FailWorkflowExecutionDecisionAttributesToJson(this);
}

enum FailWorkflowExecutionFailedCause {
  @_s.JsonValue('UNHANDLED_DECISION')
  unhandledDecision,
  @_s.JsonValue('OPERATION_NOT_PERMITTED')
  operationNotPermitted,
}

/// Provides the details of the <code>FailWorkflowExecutionFailed</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'cause')
  final FailWorkflowExecutionFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>FailWorkflowExecution</code>
  /// decision to fail this execution. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  FailWorkflowExecutionFailedEventAttributes({
    @_s.required this.cause,
    @_s.required this.decisionTaskCompletedEventId,
  });
  factory FailWorkflowExecutionFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$FailWorkflowExecutionFailedEventAttributesFromJson(json);
}

/// Paginated representation of a workflow history for a workflow execution.
/// This is the up to date, complete and authoritative record of the events
/// related to all tasks and events in the life of the workflow execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class History {
  /// The list of history events.
  @_s.JsonKey(name: 'events')
  final List<HistoryEvent> events;

  /// If a <code>NextPageToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the call
  /// again using the returned token in <code>nextPageToken</code>. Keep all other
  /// arguments unchanged.
  ///
  /// The configured <code>maximumPageSize</code> determines how many results can
  /// be returned in a single call.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  History({
    @_s.required this.events,
    this.nextPageToken,
  });
  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}

/// Event within a workflow execution. A history event can be one of these
/// types:
///
/// <ul>
/// <li>
/// <code>ActivityTaskCancelRequested</code> – A
/// <code>RequestCancelActivityTask</code> decision was received by the system.
/// </li>
/// <li>
/// <code>ActivityTaskCanceled</code> – The activity task was successfully
/// canceled.
/// </li>
/// <li>
/// <code>ActivityTaskCompleted</code> – An activity worker successfully
/// completed an activity task by calling <a>RespondActivityTaskCompleted</a>.
/// </li>
/// <li>
/// <code>ActivityTaskFailed</code> – An activity worker failed an activity task
/// by calling <a>RespondActivityTaskFailed</a>.
/// </li>
/// <li>
/// <code>ActivityTaskScheduled</code> – An activity task was scheduled for
/// execution.
/// </li>
/// <li>
/// <code>ActivityTaskStarted</code> – The scheduled activity task was
/// dispatched to a worker.
/// </li>
/// <li>
/// <code>ActivityTaskTimedOut</code> – The activity task timed out.
/// </li>
/// <li>
/// <code>CancelTimerFailed</code> – Failed to process CancelTimer decision.
/// This happens when the decision isn't configured properly, for example no
/// timer exists with the specified timer Id.
/// </li>
/// <li>
/// <code>CancelWorkflowExecutionFailed</code> – A request to cancel a workflow
/// execution failed.
/// </li>
/// <li>
/// <code>ChildWorkflowExecutionCanceled</code> – A child workflow execution,
/// started by this workflow execution, was canceled and closed.
/// </li>
/// <li>
/// <code>ChildWorkflowExecutionCompleted</code> – A child workflow execution,
/// started by this workflow execution, completed successfully and was closed.
/// </li>
/// <li>
/// <code>ChildWorkflowExecutionFailed</code> – A child workflow execution,
/// started by this workflow execution, failed to complete successfully and was
/// closed.
/// </li>
/// <li>
/// <code>ChildWorkflowExecutionStarted</code> – A child workflow execution was
/// successfully started.
/// </li>
/// <li>
/// <code>ChildWorkflowExecutionTerminated</code> – A child workflow execution,
/// started by this workflow execution, was terminated.
/// </li>
/// <li>
/// <code>ChildWorkflowExecutionTimedOut</code> – A child workflow execution,
/// started by this workflow execution, timed out and was closed.
/// </li>
/// <li>
/// <code>CompleteWorkflowExecutionFailed</code> – The workflow execution failed
/// to complete.
/// </li>
/// <li>
/// <code>ContinueAsNewWorkflowExecutionFailed</code> – The workflow execution
/// failed to complete after being continued as a new workflow execution.
/// </li>
/// <li>
/// <code>DecisionTaskCompleted</code> – The decider successfully completed a
/// decision task by calling <a>RespondDecisionTaskCompleted</a>.
/// </li>
/// <li>
/// <code>DecisionTaskScheduled</code> – A decision task was scheduled for the
/// workflow execution.
/// </li>
/// <li>
/// <code>DecisionTaskStarted</code> – The decision task was dispatched to a
/// decider.
/// </li>
/// <li>
/// <code>DecisionTaskTimedOut</code> – The decision task timed out.
/// </li>
/// <li>
/// <code>ExternalWorkflowExecutionCancelRequested</code> – Request to cancel an
/// external workflow execution was successfully delivered to the target
/// execution.
/// </li>
/// <li>
/// <code>ExternalWorkflowExecutionSignaled</code> – A signal, requested by this
/// workflow execution, was successfully delivered to the target external
/// workflow execution.
/// </li>
/// <li>
/// <code>FailWorkflowExecutionFailed</code> – A request to mark a workflow
/// execution as failed, itself failed.
/// </li>
/// <li>
/// <code>MarkerRecorded</code> – A marker was recorded in the workflow history
/// as the result of a <code>RecordMarker</code> decision.
/// </li>
/// <li>
/// <code>RecordMarkerFailed</code> – A <code>RecordMarker</code> decision was
/// returned as failed.
/// </li>
/// <li>
/// <code>RequestCancelActivityTaskFailed</code> – Failed to process
/// RequestCancelActivityTask decision. This happens when the decision isn't
/// configured properly.
/// </li>
/// <li>
/// <code>RequestCancelExternalWorkflowExecutionFailed</code> – Request to
/// cancel an external workflow execution failed.
/// </li>
/// <li>
/// <code>RequestCancelExternalWorkflowExecutionInitiated</code> – A request was
/// made to request the cancellation of an external workflow execution.
/// </li>
/// <li>
/// <code>ScheduleActivityTaskFailed</code> – Failed to process
/// ScheduleActivityTask decision. This happens when the decision isn't
/// configured properly, for example the activity type specified isn't
/// registered.
/// </li>
/// <li>
/// <code>SignalExternalWorkflowExecutionFailed</code> – The request to signal
/// an external workflow execution failed.
/// </li>
/// <li>
/// <code>SignalExternalWorkflowExecutionInitiated</code> – A request to signal
/// an external workflow was made.
/// </li>
/// <li>
/// <code>StartActivityTaskFailed</code> – A scheduled activity task failed to
/// start.
/// </li>
/// <li>
/// <code>StartChildWorkflowExecutionFailed</code> – Failed to process
/// StartChildWorkflowExecution decision. This happens when the decision isn't
/// configured properly, for example the workflow type specified isn't
/// registered.
/// </li>
/// <li>
/// <code>StartChildWorkflowExecutionInitiated</code> – A request was made to
/// start a child workflow execution.
/// </li>
/// <li>
/// <code>StartTimerFailed</code> – Failed to process StartTimer decision. This
/// happens when the decision isn't configured properly, for example a timer
/// already exists with the specified timer Id.
/// </li>
/// <li>
/// <code>TimerCanceled</code> – A timer, previously started for this workflow
/// execution, was successfully canceled.
/// </li>
/// <li>
/// <code>TimerFired</code> – A timer, previously started for this workflow
/// execution, fired.
/// </li>
/// <li>
/// <code>TimerStarted</code> – A timer was started for the workflow execution
/// due to a <code>StartTimer</code> decision.
/// </li>
/// <li>
/// <code>WorkflowExecutionCancelRequested</code> – A request to cancel this
/// workflow execution was made.
/// </li>
/// <li>
/// <code>WorkflowExecutionCanceled</code> – The workflow execution was
/// successfully canceled and closed.
/// </li>
/// <li>
/// <code>WorkflowExecutionCompleted</code> – The workflow execution was closed
/// due to successful completion.
/// </li>
/// <li>
/// <code>WorkflowExecutionContinuedAsNew</code> – The workflow execution was
/// closed and a new execution of the same type was created with the same
/// workflowId.
/// </li>
/// <li>
/// <code>WorkflowExecutionFailed</code> – The workflow execution closed due to
/// a failure.
/// </li>
/// <li>
/// <code>WorkflowExecutionSignaled</code> – An external signal was received for
/// the workflow execution.
/// </li>
/// <li>
/// <code>WorkflowExecutionStarted</code> – The workflow execution was started.
/// </li>
/// <li>
/// <code>WorkflowExecutionTerminated</code> – The workflow execution was
/// terminated.
/// </li>
/// <li>
/// <code>WorkflowExecutionTimedOut</code> – The workflow execution was closed
/// because a time out was exceeded.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HistoryEvent {
  /// The system generated ID of the event. This ID uniquely identifies the event
  /// with in the workflow execution history.
  @_s.JsonKey(name: 'eventId')
  final int eventId;

  /// The date and time when the event occurred.
  @_s.JsonKey(
      name: 'eventTimestamp', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime eventTimestamp;

  /// The type of the history event.
  @_s.JsonKey(name: 'eventType')
  final EventType eventType;

  /// If the event is of type <code>ActivityTaskcancelRequested</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  @_s.JsonKey(name: 'activityTaskCancelRequestedEventAttributes')
  final ActivityTaskCancelRequestedEventAttributes
      activityTaskCancelRequestedEventAttributes;

  /// If the event is of type <code>ActivityTaskCanceled</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(name: 'activityTaskCanceledEventAttributes')
  final ActivityTaskCanceledEventAttributes activityTaskCanceledEventAttributes;

  /// If the event is of type <code>ActivityTaskCompleted</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(name: 'activityTaskCompletedEventAttributes')
  final ActivityTaskCompletedEventAttributes
      activityTaskCompletedEventAttributes;

  /// If the event is of type <code>ActivityTaskFailed</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(name: 'activityTaskFailedEventAttributes')
  final ActivityTaskFailedEventAttributes activityTaskFailedEventAttributes;

  /// If the event is of type <code>ActivityTaskScheduled</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(name: 'activityTaskScheduledEventAttributes')
  final ActivityTaskScheduledEventAttributes
      activityTaskScheduledEventAttributes;

  /// If the event is of type <code>ActivityTaskStarted</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(name: 'activityTaskStartedEventAttributes')
  final ActivityTaskStartedEventAttributes activityTaskStartedEventAttributes;

  /// If the event is of type <code>ActivityTaskTimedOut</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(name: 'activityTaskTimedOutEventAttributes')
  final ActivityTaskTimedOutEventAttributes activityTaskTimedOutEventAttributes;

  /// If the event is of type <code>CancelTimerFailed</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(name: 'cancelTimerFailedEventAttributes')
  final CancelTimerFailedEventAttributes cancelTimerFailedEventAttributes;

  /// If the event is of type <code>CancelWorkflowExecutionFailed</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  @_s.JsonKey(name: 'cancelWorkflowExecutionFailedEventAttributes')
  final CancelWorkflowExecutionFailedEventAttributes
      cancelWorkflowExecutionFailedEventAttributes;

  /// If the event is of type <code>ChildWorkflowExecutionCanceled</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'childWorkflowExecutionCanceledEventAttributes')
  final ChildWorkflowExecutionCanceledEventAttributes
      childWorkflowExecutionCanceledEventAttributes;

  /// If the event is of type <code>ChildWorkflowExecutionCompleted</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'childWorkflowExecutionCompletedEventAttributes')
  final ChildWorkflowExecutionCompletedEventAttributes
      childWorkflowExecutionCompletedEventAttributes;

  /// If the event is of type <code>ChildWorkflowExecutionFailed</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  @_s.JsonKey(name: 'childWorkflowExecutionFailedEventAttributes')
  final ChildWorkflowExecutionFailedEventAttributes
      childWorkflowExecutionFailedEventAttributes;

  /// If the event is of type <code>ChildWorkflowExecutionStarted</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  @_s.JsonKey(name: 'childWorkflowExecutionStartedEventAttributes')
  final ChildWorkflowExecutionStartedEventAttributes
      childWorkflowExecutionStartedEventAttributes;

  /// If the event is of type <code>ChildWorkflowExecutionTerminated</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'childWorkflowExecutionTerminatedEventAttributes')
  final ChildWorkflowExecutionTerminatedEventAttributes
      childWorkflowExecutionTerminatedEventAttributes;

  /// If the event is of type <code>ChildWorkflowExecutionTimedOut</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'childWorkflowExecutionTimedOutEventAttributes')
  final ChildWorkflowExecutionTimedOutEventAttributes
      childWorkflowExecutionTimedOutEventAttributes;

  /// If the event is of type <code>CompleteWorkflowExecutionFailed</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'completeWorkflowExecutionFailedEventAttributes')
  final CompleteWorkflowExecutionFailedEventAttributes
      completeWorkflowExecutionFailedEventAttributes;

  /// If the event is of type <code>ContinueAsNewWorkflowExecutionFailed</code>
  /// then this member is set and provides detailed information about the event.
  /// It isn't set for other event types.
  @_s.JsonKey(name: 'continueAsNewWorkflowExecutionFailedEventAttributes')
  final ContinueAsNewWorkflowExecutionFailedEventAttributes
      continueAsNewWorkflowExecutionFailedEventAttributes;

  /// If the event is of type <code>DecisionTaskCompleted</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(name: 'decisionTaskCompletedEventAttributes')
  final DecisionTaskCompletedEventAttributes
      decisionTaskCompletedEventAttributes;

  /// If the event is of type <code>DecisionTaskScheduled</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(name: 'decisionTaskScheduledEventAttributes')
  final DecisionTaskScheduledEventAttributes
      decisionTaskScheduledEventAttributes;

  /// If the event is of type <code>DecisionTaskStarted</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(name: 'decisionTaskStartedEventAttributes')
  final DecisionTaskStartedEventAttributes decisionTaskStartedEventAttributes;

  /// If the event is of type <code>DecisionTaskTimedOut</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(name: 'decisionTaskTimedOutEventAttributes')
  final DecisionTaskTimedOutEventAttributes decisionTaskTimedOutEventAttributes;

  /// If the event is of type
  /// <code>ExternalWorkflowExecutionCancelRequested</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(name: 'externalWorkflowExecutionCancelRequestedEventAttributes')
  final ExternalWorkflowExecutionCancelRequestedEventAttributes
      externalWorkflowExecutionCancelRequestedEventAttributes;

  /// If the event is of type <code>ExternalWorkflowExecutionSignaled</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'externalWorkflowExecutionSignaledEventAttributes')
  final ExternalWorkflowExecutionSignaledEventAttributes
      externalWorkflowExecutionSignaledEventAttributes;

  /// If the event is of type <code>FailWorkflowExecutionFailed</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  @_s.JsonKey(name: 'failWorkflowExecutionFailedEventAttributes')
  final FailWorkflowExecutionFailedEventAttributes
      failWorkflowExecutionFailedEventAttributes;

  /// Provides the details of the <code>LambdaFunctionCompleted</code> event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'lambdaFunctionCompletedEventAttributes')
  final LambdaFunctionCompletedEventAttributes
      lambdaFunctionCompletedEventAttributes;

  /// Provides the details of the <code>LambdaFunctionFailed</code> event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'lambdaFunctionFailedEventAttributes')
  final LambdaFunctionFailedEventAttributes lambdaFunctionFailedEventAttributes;

  /// Provides the details of the <code>LambdaFunctionScheduled</code> event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'lambdaFunctionScheduledEventAttributes')
  final LambdaFunctionScheduledEventAttributes
      lambdaFunctionScheduledEventAttributes;

  /// Provides the details of the <code>LambdaFunctionStarted</code> event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'lambdaFunctionStartedEventAttributes')
  final LambdaFunctionStartedEventAttributes
      lambdaFunctionStartedEventAttributes;

  /// Provides the details of the <code>LambdaFunctionTimedOut</code> event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'lambdaFunctionTimedOutEventAttributes')
  final LambdaFunctionTimedOutEventAttributes
      lambdaFunctionTimedOutEventAttributes;

  /// If the event is of type <code>MarkerRecorded</code> then this member is set
  /// and provides detailed information about the event. It isn't set for other
  /// event types.
  @_s.JsonKey(name: 'markerRecordedEventAttributes')
  final MarkerRecordedEventAttributes markerRecordedEventAttributes;

  /// If the event is of type <code>DecisionTaskFailed</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(name: 'recordMarkerFailedEventAttributes')
  final RecordMarkerFailedEventAttributes recordMarkerFailedEventAttributes;

  /// If the event is of type <code>RequestCancelActivityTaskFailed</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'requestCancelActivityTaskFailedEventAttributes')
  final RequestCancelActivityTaskFailedEventAttributes
      requestCancelActivityTaskFailedEventAttributes;

  /// If the event is of type
  /// <code>RequestCancelExternalWorkflowExecutionFailed</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(
      name: 'requestCancelExternalWorkflowExecutionFailedEventAttributes')
  final RequestCancelExternalWorkflowExecutionFailedEventAttributes
      requestCancelExternalWorkflowExecutionFailedEventAttributes;

  /// If the event is of type
  /// <code>RequestCancelExternalWorkflowExecutionInitiated</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  @_s.JsonKey(
      name: 'requestCancelExternalWorkflowExecutionInitiatedEventAttributes')
  final RequestCancelExternalWorkflowExecutionInitiatedEventAttributes
      requestCancelExternalWorkflowExecutionInitiatedEventAttributes;

  /// If the event is of type <code>ScheduleActivityTaskFailed</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  @_s.JsonKey(name: 'scheduleActivityTaskFailedEventAttributes')
  final ScheduleActivityTaskFailedEventAttributes
      scheduleActivityTaskFailedEventAttributes;

  /// Provides the details of the <code>ScheduleLambdaFunctionFailed</code> event.
  /// It isn't set for other event types.
  @_s.JsonKey(name: 'scheduleLambdaFunctionFailedEventAttributes')
  final ScheduleLambdaFunctionFailedEventAttributes
      scheduleLambdaFunctionFailedEventAttributes;

  /// If the event is of type <code>SignalExternalWorkflowExecutionFailed</code>
  /// then this member is set and provides detailed information about the event.
  /// It isn't set for other event types.
  @_s.JsonKey(name: 'signalExternalWorkflowExecutionFailedEventAttributes')
  final SignalExternalWorkflowExecutionFailedEventAttributes
      signalExternalWorkflowExecutionFailedEventAttributes;

  /// If the event is of type
  /// <code>SignalExternalWorkflowExecutionInitiated</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(name: 'signalExternalWorkflowExecutionInitiatedEventAttributes')
  final SignalExternalWorkflowExecutionInitiatedEventAttributes
      signalExternalWorkflowExecutionInitiatedEventAttributes;

  /// If the event is of type <code>StartChildWorkflowExecutionFailed</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'startChildWorkflowExecutionFailedEventAttributes')
  final StartChildWorkflowExecutionFailedEventAttributes
      startChildWorkflowExecutionFailedEventAttributes;

  /// If the event is of type <code>StartChildWorkflowExecutionInitiated</code>
  /// then this member is set and provides detailed information about the event.
  /// It isn't set for other event types.
  @_s.JsonKey(name: 'startChildWorkflowExecutionInitiatedEventAttributes')
  final StartChildWorkflowExecutionInitiatedEventAttributes
      startChildWorkflowExecutionInitiatedEventAttributes;

  /// Provides the details of the <code>StartLambdaFunctionFailed</code> event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'startLambdaFunctionFailedEventAttributes')
  final StartLambdaFunctionFailedEventAttributes
      startLambdaFunctionFailedEventAttributes;

  /// If the event is of type <code>StartTimerFailed</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  @_s.JsonKey(name: 'startTimerFailedEventAttributes')
  final StartTimerFailedEventAttributes startTimerFailedEventAttributes;

  /// If the event is of type <code>TimerCanceled</code> then this member is set
  /// and provides detailed information about the event. It isn't set for other
  /// event types.
  @_s.JsonKey(name: 'timerCanceledEventAttributes')
  final TimerCanceledEventAttributes timerCanceledEventAttributes;

  /// If the event is of type <code>TimerFired</code> then this member is set and
  /// provides detailed information about the event. It isn't set for other event
  /// types.
  @_s.JsonKey(name: 'timerFiredEventAttributes')
  final TimerFiredEventAttributes timerFiredEventAttributes;

  /// If the event is of type <code>TimerStarted</code> then this member is set
  /// and provides detailed information about the event. It isn't set for other
  /// event types.
  @_s.JsonKey(name: 'timerStartedEventAttributes')
  final TimerStartedEventAttributes timerStartedEventAttributes;

  /// If the event is of type <code>WorkflowExecutionCancelRequested</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'workflowExecutionCancelRequestedEventAttributes')
  final WorkflowExecutionCancelRequestedEventAttributes
      workflowExecutionCancelRequestedEventAttributes;

  /// If the event is of type <code>WorkflowExecutionCanceled</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  @_s.JsonKey(name: 'workflowExecutionCanceledEventAttributes')
  final WorkflowExecutionCanceledEventAttributes
      workflowExecutionCanceledEventAttributes;

  /// If the event is of type <code>WorkflowExecutionCompleted</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  @_s.JsonKey(name: 'workflowExecutionCompletedEventAttributes')
  final WorkflowExecutionCompletedEventAttributes
      workflowExecutionCompletedEventAttributes;

  /// If the event is of type <code>WorkflowExecutionContinuedAsNew</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  @_s.JsonKey(name: 'workflowExecutionContinuedAsNewEventAttributes')
  final WorkflowExecutionContinuedAsNewEventAttributes
      workflowExecutionContinuedAsNewEventAttributes;

  /// If the event is of type <code>WorkflowExecutionFailed</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  @_s.JsonKey(name: 'workflowExecutionFailedEventAttributes')
  final WorkflowExecutionFailedEventAttributes
      workflowExecutionFailedEventAttributes;

  /// If the event is of type <code>WorkflowExecutionSignaled</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  @_s.JsonKey(name: 'workflowExecutionSignaledEventAttributes')
  final WorkflowExecutionSignaledEventAttributes
      workflowExecutionSignaledEventAttributes;

  /// If the event is of type <code>WorkflowExecutionStarted</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  @_s.JsonKey(name: 'workflowExecutionStartedEventAttributes')
  final WorkflowExecutionStartedEventAttributes
      workflowExecutionStartedEventAttributes;

  /// If the event is of type <code>WorkflowExecutionTerminated</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  @_s.JsonKey(name: 'workflowExecutionTerminatedEventAttributes')
  final WorkflowExecutionTerminatedEventAttributes
      workflowExecutionTerminatedEventAttributes;

  /// If the event is of type <code>WorkflowExecutionTimedOut</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  @_s.JsonKey(name: 'workflowExecutionTimedOutEventAttributes')
  final WorkflowExecutionTimedOutEventAttributes
      workflowExecutionTimedOutEventAttributes;

  HistoryEvent({
    @_s.required this.eventId,
    @_s.required this.eventTimestamp,
    @_s.required this.eventType,
    this.activityTaskCancelRequestedEventAttributes,
    this.activityTaskCanceledEventAttributes,
    this.activityTaskCompletedEventAttributes,
    this.activityTaskFailedEventAttributes,
    this.activityTaskScheduledEventAttributes,
    this.activityTaskStartedEventAttributes,
    this.activityTaskTimedOutEventAttributes,
    this.cancelTimerFailedEventAttributes,
    this.cancelWorkflowExecutionFailedEventAttributes,
    this.childWorkflowExecutionCanceledEventAttributes,
    this.childWorkflowExecutionCompletedEventAttributes,
    this.childWorkflowExecutionFailedEventAttributes,
    this.childWorkflowExecutionStartedEventAttributes,
    this.childWorkflowExecutionTerminatedEventAttributes,
    this.childWorkflowExecutionTimedOutEventAttributes,
    this.completeWorkflowExecutionFailedEventAttributes,
    this.continueAsNewWorkflowExecutionFailedEventAttributes,
    this.decisionTaskCompletedEventAttributes,
    this.decisionTaskScheduledEventAttributes,
    this.decisionTaskStartedEventAttributes,
    this.decisionTaskTimedOutEventAttributes,
    this.externalWorkflowExecutionCancelRequestedEventAttributes,
    this.externalWorkflowExecutionSignaledEventAttributes,
    this.failWorkflowExecutionFailedEventAttributes,
    this.lambdaFunctionCompletedEventAttributes,
    this.lambdaFunctionFailedEventAttributes,
    this.lambdaFunctionScheduledEventAttributes,
    this.lambdaFunctionStartedEventAttributes,
    this.lambdaFunctionTimedOutEventAttributes,
    this.markerRecordedEventAttributes,
    this.recordMarkerFailedEventAttributes,
    this.requestCancelActivityTaskFailedEventAttributes,
    this.requestCancelExternalWorkflowExecutionFailedEventAttributes,
    this.requestCancelExternalWorkflowExecutionInitiatedEventAttributes,
    this.scheduleActivityTaskFailedEventAttributes,
    this.scheduleLambdaFunctionFailedEventAttributes,
    this.signalExternalWorkflowExecutionFailedEventAttributes,
    this.signalExternalWorkflowExecutionInitiatedEventAttributes,
    this.startChildWorkflowExecutionFailedEventAttributes,
    this.startChildWorkflowExecutionInitiatedEventAttributes,
    this.startLambdaFunctionFailedEventAttributes,
    this.startTimerFailedEventAttributes,
    this.timerCanceledEventAttributes,
    this.timerFiredEventAttributes,
    this.timerStartedEventAttributes,
    this.workflowExecutionCancelRequestedEventAttributes,
    this.workflowExecutionCanceledEventAttributes,
    this.workflowExecutionCompletedEventAttributes,
    this.workflowExecutionContinuedAsNewEventAttributes,
    this.workflowExecutionFailedEventAttributes,
    this.workflowExecutionSignaledEventAttributes,
    this.workflowExecutionStartedEventAttributes,
    this.workflowExecutionTerminatedEventAttributes,
    this.workflowExecutionTimedOutEventAttributes,
  });
  factory HistoryEvent.fromJson(Map<String, dynamic> json) =>
      _$HistoryEventFromJson(json);
}

/// Provides the details of the <code>LambdaFunctionCompleted</code> event. It
/// isn't set for other event types.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LambdaFunctionCompletedEventAttributes {
  /// The ID of the <code>LambdaFunctionScheduled</code> event that was recorded
  /// when this Lambda task was scheduled. To help diagnose issues, use this
  /// information to trace back the chain of events leading up to this event.
  @_s.JsonKey(name: 'scheduledEventId')
  final int scheduledEventId;

  /// The ID of the <code>LambdaFunctionStarted</code> event recorded when this
  /// activity task started. To help diagnose issues, use this information to
  /// trace back the chain of events leading up to this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The results of the Lambda task.
  @_s.JsonKey(name: 'result')
  final String result;

  LambdaFunctionCompletedEventAttributes({
    @_s.required this.scheduledEventId,
    @_s.required this.startedEventId,
    this.result,
  });
  factory LambdaFunctionCompletedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$LambdaFunctionCompletedEventAttributesFromJson(json);
}

/// Provides the details of the <code>LambdaFunctionFailed</code> event. It
/// isn't set for other event types.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LambdaFunctionFailedEventAttributes {
  /// The ID of the <code>LambdaFunctionScheduled</code> event that was recorded
  /// when this activity task was scheduled. To help diagnose issues, use this
  /// information to trace back the chain of events leading up to this event.
  @_s.JsonKey(name: 'scheduledEventId')
  final int scheduledEventId;

  /// The ID of the <code>LambdaFunctionStarted</code> event recorded when this
  /// activity task started. To help diagnose issues, use this information to
  /// trace back the chain of events leading up to this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The details of the failure.
  @_s.JsonKey(name: 'details')
  final String details;

  /// The reason provided for the failure.
  @_s.JsonKey(name: 'reason')
  final String reason;

  LambdaFunctionFailedEventAttributes({
    @_s.required this.scheduledEventId,
    @_s.required this.startedEventId,
    this.details,
    this.reason,
  });
  factory LambdaFunctionFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$LambdaFunctionFailedEventAttributesFromJson(json);
}

/// Provides the details of the <code>LambdaFunctionScheduled</code> event. It
/// isn't set for other event types.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LambdaFunctionScheduledEventAttributes {
  /// The ID of the <code>LambdaFunctionCompleted</code> event corresponding to
  /// the decision that resulted in scheduling this activity task. To help
  /// diagnose issues, use this information to trace back the chain of events
  /// leading up to this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The unique ID of the Lambda task.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the Lambda function.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Data attached to the event that the decider can use in subsequent workflow
  /// tasks. This data isn't sent to the Lambda task.
  @_s.JsonKey(name: 'control')
  final String control;

  /// The input provided to the Lambda task.
  @_s.JsonKey(name: 'input')
  final String input;

  /// The maximum amount of time a worker can take to process the Lambda task.
  @_s.JsonKey(name: 'startToCloseTimeout')
  final String startToCloseTimeout;

  LambdaFunctionScheduledEventAttributes({
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.id,
    @_s.required this.name,
    this.control,
    this.input,
    this.startToCloseTimeout,
  });
  factory LambdaFunctionScheduledEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$LambdaFunctionScheduledEventAttributesFromJson(json);
}

/// Provides the details of the <code>LambdaFunctionStarted</code> event. It
/// isn't set for other event types.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LambdaFunctionStartedEventAttributes {
  /// The ID of the <code>LambdaFunctionScheduled</code> event that was recorded
  /// when this activity task was scheduled. To help diagnose issues, use this
  /// information to trace back the chain of events leading up to this event.
  @_s.JsonKey(name: 'scheduledEventId')
  final int scheduledEventId;

  LambdaFunctionStartedEventAttributes({
    @_s.required this.scheduledEventId,
  });
  factory LambdaFunctionStartedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$LambdaFunctionStartedEventAttributesFromJson(json);
}

/// Provides details of the <code>LambdaFunctionTimedOut</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LambdaFunctionTimedOutEventAttributes {
  /// The ID of the <code>LambdaFunctionScheduled</code> event that was recorded
  /// when this activity task was scheduled. To help diagnose issues, use this
  /// information to trace back the chain of events leading up to this event.
  @_s.JsonKey(name: 'scheduledEventId')
  final int scheduledEventId;

  /// The ID of the <code>ActivityTaskStarted</code> event that was recorded when
  /// this activity task started. To help diagnose issues, use this information to
  /// trace back the chain of events leading up to this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The type of the timeout that caused this event.
  @_s.JsonKey(name: 'timeoutType')
  final LambdaFunctionTimeoutType timeoutType;

  LambdaFunctionTimedOutEventAttributes({
    @_s.required this.scheduledEventId,
    @_s.required this.startedEventId,
    this.timeoutType,
  });
  factory LambdaFunctionTimedOutEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$LambdaFunctionTimedOutEventAttributesFromJson(json);
}

enum LambdaFunctionTimeoutType {
  @_s.JsonValue('START_TO_CLOSE')
  startToClose,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceOutput {
  /// An array of tags associated with the domain.
  @_s.JsonKey(name: 'tags')
  final List<ResourceTag> tags;

  ListTagsForResourceOutput({
    this.tags,
  });
  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceOutputFromJson(json);
}

/// Provides the details of the <code>MarkerRecorded</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MarkerRecordedEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>RecordMarker</code> decision that
  /// requested this marker. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The name of the marker.
  @_s.JsonKey(name: 'markerName')
  final String markerName;

  /// The details of the marker.
  @_s.JsonKey(name: 'details')
  final String details;

  MarkerRecordedEventAttributes({
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.markerName,
    this.details,
  });
  factory MarkerRecordedEventAttributes.fromJson(Map<String, dynamic> json) =>
      _$MarkerRecordedEventAttributesFromJson(json);
}

/// Contains the count of tasks in a task list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PendingTaskCount {
  /// The number of tasks in the task list.
  @_s.JsonKey(name: 'count')
  final int count;

  /// If set to true, indicates that the actual count was more than the maximum
  /// supported by this API and the count returned is the truncated value.
  @_s.JsonKey(name: 'truncated')
  final bool truncated;

  PendingTaskCount({
    @_s.required this.count,
    this.truncated,
  });
  factory PendingTaskCount.fromJson(Map<String, dynamic> json) =>
      _$PendingTaskCountFromJson(json);
}

/// Provides the details of the <code>RecordMarker</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RecordMarkerDecisionAttributes {
  /// The name of the marker.
  @_s.JsonKey(name: 'markerName')
  final String markerName;

  /// The details of the marker.
  @_s.JsonKey(name: 'details')
  final String details;

  RecordMarkerDecisionAttributes({
    @_s.required this.markerName,
    this.details,
  });
  Map<String, dynamic> toJson() => _$RecordMarkerDecisionAttributesToJson(this);
}

enum RecordMarkerFailedCause {
  @_s.JsonValue('OPERATION_NOT_PERMITTED')
  operationNotPermitted,
}

/// Provides the details of the <code>RecordMarkerFailed</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecordMarkerFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'cause')
  final RecordMarkerFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>RecordMarkerFailed</code> decision
  /// for this cancellation request. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The marker's name.
  @_s.JsonKey(name: 'markerName')
  final String markerName;

  RecordMarkerFailedEventAttributes({
    @_s.required this.cause,
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.markerName,
  });
  factory RecordMarkerFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$RecordMarkerFailedEventAttributesFromJson(json);
}

enum RegistrationStatus {
  @_s.JsonValue('REGISTERED')
  registered,
  @_s.JsonValue('DEPRECATED')
  deprecated,
}

extension on RegistrationStatus {
  String toValue() {
    switch (this) {
      case RegistrationStatus.registered:
        return 'REGISTERED';
      case RegistrationStatus.deprecated:
        return 'DEPRECATED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Provides the details of the <code>RequestCancelActivityTask</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RequestCancelActivityTaskDecisionAttributes {
  /// The <code>activityId</code> of the activity task to be canceled.
  @_s.JsonKey(name: 'activityId')
  final String activityId;

  RequestCancelActivityTaskDecisionAttributes({
    @_s.required this.activityId,
  });
  Map<String, dynamic> toJson() =>
      _$RequestCancelActivityTaskDecisionAttributesToJson(this);
}

enum RequestCancelActivityTaskFailedCause {
  @_s.JsonValue('ACTIVITY_ID_UNKNOWN')
  activityIdUnknown,
  @_s.JsonValue('OPERATION_NOT_PERMITTED')
  operationNotPermitted,
}

/// Provides the details of the <code>RequestCancelActivityTaskFailed</code>
/// event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RequestCancelActivityTaskFailedEventAttributes {
  /// The activityId provided in the <code>RequestCancelActivityTask</code>
  /// decision that failed.
  @_s.JsonKey(name: 'activityId')
  final String activityId;

  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'cause')
  final RequestCancelActivityTaskFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>RequestCancelActivityTask</code>
  /// decision for this cancellation request. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  RequestCancelActivityTaskFailedEventAttributes({
    @_s.required this.activityId,
    @_s.required this.cause,
    @_s.required this.decisionTaskCompletedEventId,
  });
  factory RequestCancelActivityTaskFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$RequestCancelActivityTaskFailedEventAttributesFromJson(json);
}

/// Provides the details of the
/// <code>RequestCancelExternalWorkflowExecution</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RequestCancelExternalWorkflowExecutionDecisionAttributes {
  /// The <code>workflowId</code> of the external workflow execution to cancel.
  @_s.JsonKey(name: 'workflowId')
  final String workflowId;

  /// The data attached to the event that can be used by the decider in subsequent
  /// workflow tasks.
  @_s.JsonKey(name: 'control')
  final String control;

  /// The <code>runId</code> of the external workflow execution to cancel.
  @_s.JsonKey(name: 'runId')
  final String runId;

  RequestCancelExternalWorkflowExecutionDecisionAttributes({
    @_s.required this.workflowId,
    this.control,
    this.runId,
  });
  Map<String, dynamic> toJson() =>
      _$RequestCancelExternalWorkflowExecutionDecisionAttributesToJson(this);
}

enum RequestCancelExternalWorkflowExecutionFailedCause {
  @_s.JsonValue('UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION')
  unknownExternalWorkflowExecution,
  @_s.JsonValue('REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED')
  requestCancelExternalWorkflowExecutionRateExceeded,
  @_s.JsonValue('OPERATION_NOT_PERMITTED')
  operationNotPermitted,
}

/// Provides the details of the
/// <code>RequestCancelExternalWorkflowExecutionFailed</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RequestCancelExternalWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'cause')
  final RequestCancelExternalWorkflowExecutionFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the
  /// <code>RequestCancelExternalWorkflowExecution</code> decision for this
  /// cancellation request. This information can be useful for diagnosing problems
  /// by tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The ID of the <code>RequestCancelExternalWorkflowExecutionInitiated</code>
  /// event corresponding to the
  /// <code>RequestCancelExternalWorkflowExecution</code> decision to cancel this
  /// external workflow execution. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'initiatedEventId')
  final int initiatedEventId;

  /// The <code>workflowId</code> of the external workflow to which the cancel
  /// request was to be delivered.
  @_s.JsonKey(name: 'workflowId')
  final String workflowId;

  /// The data attached to the event that the decider can use in subsequent
  /// workflow tasks. This data isn't sent to the workflow execution.
  @_s.JsonKey(name: 'control')
  final String control;

  /// The <code>runId</code> of the external workflow execution.
  @_s.JsonKey(name: 'runId')
  final String runId;

  RequestCancelExternalWorkflowExecutionFailedEventAttributes({
    @_s.required this.cause,
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.initiatedEventId,
    @_s.required this.workflowId,
    this.control,
    this.runId,
  });
  factory RequestCancelExternalWorkflowExecutionFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$RequestCancelExternalWorkflowExecutionFailedEventAttributesFromJson(
          json);
}

/// Provides the details of the
/// <code>RequestCancelExternalWorkflowExecutionInitiated</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RequestCancelExternalWorkflowExecutionInitiatedEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the
  /// <code>RequestCancelExternalWorkflowExecution</code> decision for this
  /// cancellation request. This information can be useful for diagnosing problems
  /// by tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The <code>workflowId</code> of the external workflow execution to be
  /// canceled.
  @_s.JsonKey(name: 'workflowId')
  final String workflowId;

  /// Data attached to the event that can be used by the decider in subsequent
  /// workflow tasks.
  @_s.JsonKey(name: 'control')
  final String control;

  /// The <code>runId</code> of the external workflow execution to be canceled.
  @_s.JsonKey(name: 'runId')
  final String runId;

  RequestCancelExternalWorkflowExecutionInitiatedEventAttributes({
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.workflowId,
    this.control,
    this.runId,
  });
  factory RequestCancelExternalWorkflowExecutionInitiatedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$RequestCancelExternalWorkflowExecutionInitiatedEventAttributesFromJson(
          json);
}

/// Tags are key-value pairs that can be associated with Amazon SWF state
/// machines and activities.
///
/// Tags may only contain unicode letters, digits, whitespace, or these symbols:
/// <code>_ . : / = + - @</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceTag {
  /// The key of a tag.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The value of a tag.
  @_s.JsonKey(name: 'value')
  final String value;

  ResourceTag({
    @_s.required this.key,
    this.value,
  });
  factory ResourceTag.fromJson(Map<String, dynamic> json) =>
      _$ResourceTagFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceTagToJson(this);
}

/// Specifies the <code>runId</code> of a workflow execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Run {
  /// The <code>runId</code> of a workflow execution. This ID is generated by the
  /// service and can be used to uniquely identify the workflow execution within a
  /// domain.
  @_s.JsonKey(name: 'runId')
  final String runId;

  Run({
    this.runId,
  });
  factory Run.fromJson(Map<String, dynamic> json) => _$RunFromJson(json);
}

/// Provides the details of the <code>ScheduleActivityTask</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// Constrain the following parameters by using a <code>Condition</code> element
/// with the appropriate keys.
///
/// <ul>
/// <li>
/// <code>activityType.name</code> – String constraint. The key is
/// <code>swf:activityType.name</code>.
/// </li>
/// <li>
/// <code>activityType.version</code> – String constraint. The key is
/// <code>swf:activityType.version</code>.
/// </li>
/// <li>
/// <code>taskList</code> – String constraint. The key is
/// <code>swf:taskList.name</code>.
/// </li>
/// </ul> </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ScheduleActivityTaskDecisionAttributes {
  /// The <code>activityId</code> of the activity task.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must not contain the literal string
  /// <code>arn</code>.
  @_s.JsonKey(name: 'activityId')
  final String activityId;

  /// The type of the activity task to schedule.
  @_s.JsonKey(name: 'activityType')
  final ActivityType activityType;

  /// Data attached to the event that can be used by the decider in subsequent
  /// workflow tasks. This data isn't sent to the activity.
  @_s.JsonKey(name: 'control')
  final String control;

  /// If set, specifies the maximum time before which a worker processing a task
  /// of this type must report progress by calling
  /// <a>RecordActivityTaskHeartbeat</a>. If the timeout is exceeded, the activity
  /// task is automatically timed out. If the worker subsequently attempts to
  /// record a heartbeat or returns a result, it is ignored. This overrides the
  /// default heartbeat timeout specified when registering the activity type using
  /// <a>RegisterActivityType</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'heartbeatTimeout')
  final String heartbeatTimeout;

  /// The input provided to the activity task.
  @_s.JsonKey(name: 'input')
  final String input;

  /// The maximum duration for this activity task.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  /// <note>
  /// A schedule-to-close timeout for this activity task must be specified either
  /// as a default for the activity type or through this field. If neither this
  /// field is set nor a default schedule-to-close timeout was specified at
  /// registration time then a fault is returned.
  /// </note>
  @_s.JsonKey(name: 'scheduleToCloseTimeout')
  final String scheduleToCloseTimeout;

  /// If set, specifies the maximum duration the activity task can wait to be
  /// assigned to a worker. This overrides the default schedule-to-start timeout
  /// specified when registering the activity type using
  /// <a>RegisterActivityType</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  /// <note>
  /// A schedule-to-start timeout for this activity task must be specified either
  /// as a default for the activity type or through this field. If neither this
  /// field is set nor a default schedule-to-start timeout was specified at
  /// registration time then a fault is returned.
  /// </note>
  @_s.JsonKey(name: 'scheduleToStartTimeout')
  final String scheduleToStartTimeout;

  /// If set, specifies the maximum duration a worker may take to process this
  /// activity task. This overrides the default start-to-close timeout specified
  /// when registering the activity type using <a>RegisterActivityType</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  /// <note>
  /// A start-to-close timeout for this activity task must be specified either as
  /// a default for the activity type or through this field. If neither this field
  /// is set nor a default start-to-close timeout was specified at registration
  /// time then a fault is returned.
  /// </note>
  @_s.JsonKey(name: 'startToCloseTimeout')
  final String startToCloseTimeout;

  /// If set, specifies the name of the task list in which to schedule the
  /// activity task. If not specified, the <code>defaultTaskList</code> registered
  /// with the activity type is used.
  /// <note>
  /// A task list for this activity task must be specified either as a default for
  /// the activity type or through this field. If neither this field is set nor a
  /// default task list was specified at registration time then a fault is
  /// returned.
  /// </note>
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must not contain the literal string
  /// <code>arn</code>.
  @_s.JsonKey(name: 'taskList')
  final TaskList taskList;

  /// If set, specifies the priority with which the activity task is to be
  /// assigned to a worker. This overrides the defaultTaskPriority specified when
  /// registering the activity type using <a>RegisterActivityType</a>. Valid
  /// values are integers that range from Java's <code>Integer.MIN_VALUE</code>
  /// (-2147483648) to <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers
  /// indicate higher priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  @_s.JsonKey(name: 'taskPriority')
  final String taskPriority;

  ScheduleActivityTaskDecisionAttributes({
    @_s.required this.activityId,
    @_s.required this.activityType,
    this.control,
    this.heartbeatTimeout,
    this.input,
    this.scheduleToCloseTimeout,
    this.scheduleToStartTimeout,
    this.startToCloseTimeout,
    this.taskList,
    this.taskPriority,
  });
  Map<String, dynamic> toJson() =>
      _$ScheduleActivityTaskDecisionAttributesToJson(this);
}

enum ScheduleActivityTaskFailedCause {
  @_s.JsonValue('ACTIVITY_TYPE_DEPRECATED')
  activityTypeDeprecated,
  @_s.JsonValue('ACTIVITY_TYPE_DOES_NOT_EXIST')
  activityTypeDoesNotExist,
  @_s.JsonValue('ACTIVITY_ID_ALREADY_IN_USE')
  activityIdAlreadyInUse,
  @_s.JsonValue('OPEN_ACTIVITIES_LIMIT_EXCEEDED')
  openActivitiesLimitExceeded,
  @_s.JsonValue('ACTIVITY_CREATION_RATE_EXCEEDED')
  activityCreationRateExceeded,
  @_s.JsonValue('DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED')
  defaultScheduleToCloseTimeoutUndefined,
  @_s.JsonValue('DEFAULT_TASK_LIST_UNDEFINED')
  defaultTaskListUndefined,
  @_s.JsonValue('DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED')
  defaultScheduleToStartTimeoutUndefined,
  @_s.JsonValue('DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED')
  defaultStartToCloseTimeoutUndefined,
  @_s.JsonValue('DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED')
  defaultHeartbeatTimeoutUndefined,
  @_s.JsonValue('OPERATION_NOT_PERMITTED')
  operationNotPermitted,
}

/// Provides the details of the <code>ScheduleActivityTaskFailed</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScheduleActivityTaskFailedEventAttributes {
  /// The activityId provided in the <code>ScheduleActivityTask</code> decision
  /// that failed.
  @_s.JsonKey(name: 'activityId')
  final String activityId;

  /// The activity type provided in the <code>ScheduleActivityTask</code> decision
  /// that failed.
  @_s.JsonKey(name: 'activityType')
  final ActivityType activityType;

  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'cause')
  final ScheduleActivityTaskFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision that resulted in the scheduling of this activity task. This
  /// information can be useful for diagnosing problems by tracing back the chain
  /// of events leading up to this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  ScheduleActivityTaskFailedEventAttributes({
    @_s.required this.activityId,
    @_s.required this.activityType,
    @_s.required this.cause,
    @_s.required this.decisionTaskCompletedEventId,
  });
  factory ScheduleActivityTaskFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ScheduleActivityTaskFailedEventAttributesFromJson(json);
}

/// Decision attributes specified in
/// <code>scheduleLambdaFunctionDecisionAttributes</code> within the list of
/// decisions <code>decisions</code> passed to
/// <a>RespondDecisionTaskCompleted</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ScheduleLambdaFunctionDecisionAttributes {
  /// A string that identifies the Lambda function execution in the event history.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name, or ARN, of the Lambda function to schedule.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The data attached to the event that the decider can use in subsequent
  /// workflow tasks. This data isn't sent to the Lambda task.
  @_s.JsonKey(name: 'control')
  final String control;

  /// The optional input data to be supplied to the Lambda function.
  @_s.JsonKey(name: 'input')
  final String input;

  /// The timeout value, in seconds, after which the Lambda function is considered
  /// to be failed once it has started. This can be any integer from 1-300
  /// (1s-5m). If no value is supplied, than a default value of 300s is assumed.
  @_s.JsonKey(name: 'startToCloseTimeout')
  final String startToCloseTimeout;

  ScheduleLambdaFunctionDecisionAttributes({
    @_s.required this.id,
    @_s.required this.name,
    this.control,
    this.input,
    this.startToCloseTimeout,
  });
  Map<String, dynamic> toJson() =>
      _$ScheduleLambdaFunctionDecisionAttributesToJson(this);
}

enum ScheduleLambdaFunctionFailedCause {
  @_s.JsonValue('ID_ALREADY_IN_USE')
  idAlreadyInUse,
  @_s.JsonValue('OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED')
  openLambdaFunctionsLimitExceeded,
  @_s.JsonValue('LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED')
  lambdaFunctionCreationRateExceeded,
  @_s.JsonValue('LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION')
  lambdaServiceNotAvailableInRegion,
}

/// Provides the details of the <code>ScheduleLambdaFunctionFailed</code> event.
/// It isn't set for other event types.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScheduleLambdaFunctionFailedEventAttributes {
  /// The cause of the failure. To help diagnose issues, use this information to
  /// trace back the chain of events leading up to this event.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'cause')
  final ScheduleLambdaFunctionFailedCause cause;

  /// The ID of the <code>LambdaFunctionCompleted</code> event corresponding to
  /// the decision that resulted in scheduling this Lambda task. To help diagnose
  /// issues, use this information to trace back the chain of events leading up to
  /// this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The ID provided in the <code>ScheduleLambdaFunction</code> decision that
  /// failed.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the Lambda function.
  @_s.JsonKey(name: 'name')
  final String name;

  ScheduleLambdaFunctionFailedEventAttributes({
    @_s.required this.cause,
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.id,
    @_s.required this.name,
  });
  factory ScheduleLambdaFunctionFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ScheduleLambdaFunctionFailedEventAttributesFromJson(json);
}

/// Provides the details of the <code>SignalExternalWorkflowExecution</code>
/// decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SignalExternalWorkflowExecutionDecisionAttributes {
  /// The name of the signal.The target workflow execution uses the signal name
  /// and input to process the signal.
  @_s.JsonKey(name: 'signalName')
  final String signalName;

  /// The <code>workflowId</code> of the workflow execution to be signaled.
  @_s.JsonKey(name: 'workflowId')
  final String workflowId;

  /// The data attached to the event that can be used by the decider in subsequent
  /// decision tasks.
  @_s.JsonKey(name: 'control')
  final String control;

  /// The input data to be provided with the signal. The target workflow execution
  /// uses the signal name and input data to process the signal.
  @_s.JsonKey(name: 'input')
  final String input;

  /// The <code>runId</code> of the workflow execution to be signaled.
  @_s.JsonKey(name: 'runId')
  final String runId;

  SignalExternalWorkflowExecutionDecisionAttributes({
    @_s.required this.signalName,
    @_s.required this.workflowId,
    this.control,
    this.input,
    this.runId,
  });
  Map<String, dynamic> toJson() =>
      _$SignalExternalWorkflowExecutionDecisionAttributesToJson(this);
}

enum SignalExternalWorkflowExecutionFailedCause {
  @_s.JsonValue('UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION')
  unknownExternalWorkflowExecution,
  @_s.JsonValue('SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED')
  signalExternalWorkflowExecutionRateExceeded,
  @_s.JsonValue('OPERATION_NOT_PERMITTED')
  operationNotPermitted,
}

/// Provides the details of the
/// <code>SignalExternalWorkflowExecutionFailed</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SignalExternalWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'cause')
  final SignalExternalWorkflowExecutionFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the
  /// <code>SignalExternalWorkflowExecution</code> decision for this signal. This
  /// information can be useful for diagnosing problems by tracing back the chain
  /// of events leading up to this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The ID of the <code>SignalExternalWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>SignalExternalWorkflowExecution</code> decision
  /// to request this signal. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'initiatedEventId')
  final int initiatedEventId;

  /// The <code>workflowId</code> of the external workflow execution that the
  /// signal was being delivered to.
  @_s.JsonKey(name: 'workflowId')
  final String workflowId;

  /// The data attached to the event that the decider can use in subsequent
  /// workflow tasks. This data isn't sent to the workflow execution.
  @_s.JsonKey(name: 'control')
  final String control;

  /// The <code>runId</code> of the external workflow execution that the signal
  /// was being delivered to.
  @_s.JsonKey(name: 'runId')
  final String runId;

  SignalExternalWorkflowExecutionFailedEventAttributes({
    @_s.required this.cause,
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.initiatedEventId,
    @_s.required this.workflowId,
    this.control,
    this.runId,
  });
  factory SignalExternalWorkflowExecutionFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$SignalExternalWorkflowExecutionFailedEventAttributesFromJson(json);
}

/// Provides the details of the
/// <code>SignalExternalWorkflowExecutionInitiated</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SignalExternalWorkflowExecutionInitiatedEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the
  /// <code>SignalExternalWorkflowExecution</code> decision for this signal. This
  /// information can be useful for diagnosing problems by tracing back the chain
  /// of events leading up to this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The name of the signal.
  @_s.JsonKey(name: 'signalName')
  final String signalName;

  /// The <code>workflowId</code> of the external workflow execution.
  @_s.JsonKey(name: 'workflowId')
  final String workflowId;

  /// Data attached to the event that can be used by the decider in subsequent
  /// decision tasks.
  @_s.JsonKey(name: 'control')
  final String control;

  /// The input provided to the signal.
  @_s.JsonKey(name: 'input')
  final String input;

  /// The <code>runId</code> of the external workflow execution to send the signal
  /// to.
  @_s.JsonKey(name: 'runId')
  final String runId;

  SignalExternalWorkflowExecutionInitiatedEventAttributes({
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.signalName,
    @_s.required this.workflowId,
    this.control,
    this.input,
    this.runId,
  });
  factory SignalExternalWorkflowExecutionInitiatedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$SignalExternalWorkflowExecutionInitiatedEventAttributesFromJson(json);
}

/// Provides the details of the <code>StartChildWorkflowExecution</code>
/// decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// Constrain the following parameters by using a <code>Condition</code> element
/// with the appropriate keys.
///
/// <ul>
/// <li>
/// <code>tagList.member.N</code> – The key is "swf:tagList.N" where N is the
/// tag number from 0 to 4, inclusive.
/// </li>
/// <li>
/// <code>taskList</code> – String constraint. The key is
/// <code>swf:taskList.name</code>.
/// </li>
/// <li>
/// <code>workflowType.name</code> – String constraint. The key is
/// <code>swf:workflowType.name</code>.
/// </li>
/// <li>
/// <code>workflowType.version</code> – String constraint. The key is
/// <code>swf:workflowType.version</code>.
/// </li>
/// </ul> </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartChildWorkflowExecutionDecisionAttributes {
  /// The <code>workflowId</code> of the workflow execution.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must not contain the literal string
  /// <code>arn</code>.
  @_s.JsonKey(name: 'workflowId')
  final String workflowId;

  /// The type of the workflow execution to be started.
  @_s.JsonKey(name: 'workflowType')
  final WorkflowType workflowType;

  /// If set, specifies the policy to use for the child workflow executions if the
  /// workflow execution being started is terminated by calling the
  /// <a>TerminateWorkflowExecution</a> action explicitly or due to an expired
  /// timeout. This policy overrides the default child policy specified when
  /// registering the workflow type using <a>RegisterWorkflowType</a>.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul> <note>
  /// A child policy for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default child policy was specified at registration
  /// time then a fault is returned.
  /// </note>
  @_s.JsonKey(name: 'childPolicy')
  final ChildPolicy childPolicy;

  /// The data attached to the event that can be used by the decider in subsequent
  /// workflow tasks. This data isn't sent to the child workflow execution.
  @_s.JsonKey(name: 'control')
  final String control;

  /// The total duration for this workflow execution. This overrides the
  /// defaultExecutionStartToCloseTimeout specified when registering the workflow
  /// type.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  /// <note>
  /// An execution start-to-close timeout for this workflow execution must be
  /// specified either as a default for the workflow type or through this
  /// parameter. If neither this parameter is set nor a default execution
  /// start-to-close timeout was specified at registration time then a fault is
  /// returned.
  /// </note>
  @_s.JsonKey(name: 'executionStartToCloseTimeout')
  final String executionStartToCloseTimeout;

  /// The input to be provided to the workflow execution.
  @_s.JsonKey(name: 'input')
  final String input;

  /// The IAM role attached to the child workflow execution.
  @_s.JsonKey(name: 'lambdaRole')
  final String lambdaRole;

  /// The list of tags to associate with the child workflow execution. A maximum
  /// of 5 tags can be specified. You can list workflow executions with a specific
  /// tag by calling <a>ListOpenWorkflowExecutions</a> or
  /// <a>ListClosedWorkflowExecutions</a> and specifying a <a>TagFilter</a>.
  @_s.JsonKey(name: 'tagList')
  final List<String> tagList;

  /// The name of the task list to be used for decision tasks of the child
  /// workflow execution.
  /// <note>
  /// A task list for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default task list was specified at registration time
  /// then a fault is returned.
  /// </note>
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must not contain the literal string
  /// <code>arn</code>.
  @_s.JsonKey(name: 'taskList')
  final TaskList taskList;

  /// A task priority that, if set, specifies the priority for a decision task of
  /// this workflow execution. This overrides the defaultTaskPriority specified
  /// when registering the workflow type. Valid values are integers that range
  /// from Java's <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate higher
  /// priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  @_s.JsonKey(name: 'taskPriority')
  final String taskPriority;

  /// Specifies the maximum duration of decision tasks for this workflow
  /// execution. This parameter overrides the
  /// <code>defaultTaskStartToCloseTimout</code> specified when registering the
  /// workflow type using <a>RegisterWorkflowType</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  /// <note>
  /// A task start-to-close timeout for this workflow execution must be specified
  /// either as a default for the workflow type or through this parameter. If
  /// neither this parameter is set nor a default task start-to-close timeout was
  /// specified at registration time then a fault is returned.
  /// </note>
  @_s.JsonKey(name: 'taskStartToCloseTimeout')
  final String taskStartToCloseTimeout;

  StartChildWorkflowExecutionDecisionAttributes({
    @_s.required this.workflowId,
    @_s.required this.workflowType,
    this.childPolicy,
    this.control,
    this.executionStartToCloseTimeout,
    this.input,
    this.lambdaRole,
    this.tagList,
    this.taskList,
    this.taskPriority,
    this.taskStartToCloseTimeout,
  });
  Map<String, dynamic> toJson() =>
      _$StartChildWorkflowExecutionDecisionAttributesToJson(this);
}

enum StartChildWorkflowExecutionFailedCause {
  @_s.JsonValue('WORKFLOW_TYPE_DOES_NOT_EXIST')
  workflowTypeDoesNotExist,
  @_s.JsonValue('WORKFLOW_TYPE_DEPRECATED')
  workflowTypeDeprecated,
  @_s.JsonValue('OPEN_CHILDREN_LIMIT_EXCEEDED')
  openChildrenLimitExceeded,
  @_s.JsonValue('OPEN_WORKFLOWS_LIMIT_EXCEEDED')
  openWorkflowsLimitExceeded,
  @_s.JsonValue('CHILD_CREATION_RATE_EXCEEDED')
  childCreationRateExceeded,
  @_s.JsonValue('WORKFLOW_ALREADY_RUNNING')
  workflowAlreadyRunning,
  @_s.JsonValue('DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED')
  defaultExecutionStartToCloseTimeoutUndefined,
  @_s.JsonValue('DEFAULT_TASK_LIST_UNDEFINED')
  defaultTaskListUndefined,
  @_s.JsonValue('DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED')
  defaultTaskStartToCloseTimeoutUndefined,
  @_s.JsonValue('DEFAULT_CHILD_POLICY_UNDEFINED')
  defaultChildPolicyUndefined,
  @_s.JsonValue('OPERATION_NOT_PERMITTED')
  operationNotPermitted,
}

/// Provides the details of the <code>StartChildWorkflowExecutionFailed</code>
/// event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartChildWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// When <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision fails because it lacks sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">
  /// Using IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'cause')
  final StartChildWorkflowExecutionFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to request this child workflow execution. This information
  /// can be useful for diagnosing problems by tracing back the chain of events.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// When the <code>cause</code> is <code>WORKFLOW_ALREADY_RUNNING</code>,
  /// <code>initiatedEventId</code> is the ID of the
  /// <code>StartChildWorkflowExecutionInitiated</code> event that corresponds to
  /// the <code>StartChildWorkflowExecution</code> <a>Decision</a> to start the
  /// workflow execution. You can use this information to diagnose problems by
  /// tracing back the chain of events leading up to this event.
  ///
  /// When the <code>cause</code> isn't <code>WORKFLOW_ALREADY_RUNNING</code>,
  /// <code>initiatedEventId</code> is set to <code>0</code> because the
  /// <code>StartChildWorkflowExecutionInitiated</code> event doesn't exist.
  @_s.JsonKey(name: 'initiatedEventId')
  final int initiatedEventId;

  /// The <code>workflowId</code> of the child workflow execution.
  @_s.JsonKey(name: 'workflowId')
  final String workflowId;

  /// The workflow type provided in the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> that failed.
  @_s.JsonKey(name: 'workflowType')
  final WorkflowType workflowType;

  /// The data attached to the event that the decider can use in subsequent
  /// workflow tasks. This data isn't sent to the child workflow execution.
  @_s.JsonKey(name: 'control')
  final String control;

  StartChildWorkflowExecutionFailedEventAttributes({
    @_s.required this.cause,
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.initiatedEventId,
    @_s.required this.workflowId,
    @_s.required this.workflowType,
    this.control,
  });
  factory StartChildWorkflowExecutionFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$StartChildWorkflowExecutionFailedEventAttributesFromJson(json);
}

/// Provides the details of the
/// <code>StartChildWorkflowExecutionInitiated</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartChildWorkflowExecutionInitiatedEventAttributes {
  /// The policy to use for the child workflow executions if this execution gets
  /// terminated by explicitly calling the <a>TerminateWorkflowExecution</a>
  /// action or due to an expired timeout.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'childPolicy')
  final ChildPolicy childPolicy;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to request this child workflow execution. This information
  /// can be useful for diagnosing problems by tracing back the cause of events.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The name of the task list used for the decision tasks of the child workflow
  /// execution.
  @_s.JsonKey(name: 'taskList')
  final TaskList taskList;

  /// The <code>workflowId</code> of the child workflow execution.
  @_s.JsonKey(name: 'workflowId')
  final String workflowId;

  /// The type of the child workflow execution.
  @_s.JsonKey(name: 'workflowType')
  final WorkflowType workflowType;

  /// Data attached to the event that can be used by the decider in subsequent
  /// decision tasks. This data isn't sent to the activity.
  @_s.JsonKey(name: 'control')
  final String control;

  /// The maximum duration for the child workflow execution. If the workflow
  /// execution isn't closed within this duration, it is timed out and
  /// force-terminated.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'executionStartToCloseTimeout')
  final String executionStartToCloseTimeout;

  /// The inputs provided to the child workflow execution.
  @_s.JsonKey(name: 'input')
  final String input;

  /// The IAM role to attach to the child workflow execution.
  @_s.JsonKey(name: 'lambdaRole')
  final String lambdaRole;

  /// The list of tags to associated with the child workflow execution.
  @_s.JsonKey(name: 'tagList')
  final List<String> tagList;

  /// The priority assigned for the decision tasks for this workflow execution.
  /// Valid values are integers that range from Java's
  /// <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate higher
  /// priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  @_s.JsonKey(name: 'taskPriority')
  final String taskPriority;

  /// The maximum duration allowed for the decision tasks for this workflow
  /// execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'taskStartToCloseTimeout')
  final String taskStartToCloseTimeout;

  StartChildWorkflowExecutionInitiatedEventAttributes({
    @_s.required this.childPolicy,
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.taskList,
    @_s.required this.workflowId,
    @_s.required this.workflowType,
    this.control,
    this.executionStartToCloseTimeout,
    this.input,
    this.lambdaRole,
    this.tagList,
    this.taskPriority,
    this.taskStartToCloseTimeout,
  });
  factory StartChildWorkflowExecutionInitiatedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$StartChildWorkflowExecutionInitiatedEventAttributesFromJson(json);
}

enum StartLambdaFunctionFailedCause {
  @_s.JsonValue('ASSUME_ROLE_FAILED')
  assumeRoleFailed,
}

/// Provides the details of the <code>StartLambdaFunctionFailed</code> event. It
/// isn't set for other event types.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartLambdaFunctionFailedEventAttributes {
  /// The cause of the failure. To help diagnose issues, use this information to
  /// trace back the chain of events leading up to this event.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because the IAM role attached to the execution lacked
  /// sufficient permissions. For details and example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html">Lambda
  /// Tasks</a> in the <i>Amazon SWF Developer Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'cause')
  final StartLambdaFunctionFailedCause cause;

  /// A description that can help diagnose the cause of the fault.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The ID of the <code>ActivityTaskScheduled</code> event that was recorded
  /// when this activity task was scheduled. To help diagnose issues, use this
  /// information to trace back the chain of events leading up to this event.
  @_s.JsonKey(name: 'scheduledEventId')
  final int scheduledEventId;

  StartLambdaFunctionFailedEventAttributes({
    this.cause,
    this.message,
    this.scheduledEventId,
  });
  factory StartLambdaFunctionFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$StartLambdaFunctionFailedEventAttributesFromJson(json);
}

/// Provides the details of the <code>StartTimer</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartTimerDecisionAttributes {
  /// The duration to wait before firing the timer.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>.
  @_s.JsonKey(name: 'startToFireTimeout')
  final String startToFireTimeout;

  /// The unique ID of the timer.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must not contain the literal string
  /// <code>arn</code>.
  @_s.JsonKey(name: 'timerId')
  final String timerId;

  /// The data attached to the event that can be used by the decider in subsequent
  /// workflow tasks.
  @_s.JsonKey(name: 'control')
  final String control;

  StartTimerDecisionAttributes({
    @_s.required this.startToFireTimeout,
    @_s.required this.timerId,
    this.control,
  });
  Map<String, dynamic> toJson() => _$StartTimerDecisionAttributesToJson(this);
}

enum StartTimerFailedCause {
  @_s.JsonValue('TIMER_ID_ALREADY_IN_USE')
  timerIdAlreadyInUse,
  @_s.JsonValue('OPEN_TIMERS_LIMIT_EXCEEDED')
  openTimersLimitExceeded,
  @_s.JsonValue('TIMER_CREATION_RATE_EXCEEDED')
  timerCreationRateExceeded,
  @_s.JsonValue('OPERATION_NOT_PERMITTED')
  operationNotPermitted,
}

/// Provides the details of the <code>StartTimerFailed</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartTimerFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'cause')
  final StartTimerFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>StartTimer</code> decision for this
  /// activity task. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The timerId provided in the <code>StartTimer</code> decision that failed.
  @_s.JsonKey(name: 'timerId')
  final String timerId;

  StartTimerFailedEventAttributes({
    @_s.required this.cause,
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.timerId,
  });
  factory StartTimerFailedEventAttributes.fromJson(Map<String, dynamic> json) =>
      _$StartTimerFailedEventAttributesFromJson(json);
}

/// Used to filter the workflow executions in visibility APIs based on a tag.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TagFilter {
  /// Specifies the tag that must be associated with the execution for it to meet
  /// the filter criteria.
  ///
  /// Tags may only contain unicode letters, digits, whitespace, or these symbols:
  /// <code>_ . : / = + - @</code>.
  @_s.JsonKey(name: 'tag')
  final String tag;

  TagFilter({
    @_s.required this.tag,
  });
  Map<String, dynamic> toJson() => _$TagFilterToJson(this);
}

/// Represents a task list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TaskList {
  /// The name of the task list.
  @_s.JsonKey(name: 'name')
  final String name;

  TaskList({
    @_s.required this.name,
  });
  factory TaskList.fromJson(Map<String, dynamic> json) =>
      _$TaskListFromJson(json);

  Map<String, dynamic> toJson() => _$TaskListToJson(this);
}

/// Provides the details of the <code>TimerCanceled</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TimerCanceledEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>CancelTimer</code> decision to
  /// cancel this timer. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The ID of the <code>TimerStarted</code> event that was recorded when this
  /// timer was started. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The unique ID of the timer that was canceled.
  @_s.JsonKey(name: 'timerId')
  final String timerId;

  TimerCanceledEventAttributes({
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.startedEventId,
    @_s.required this.timerId,
  });
  factory TimerCanceledEventAttributes.fromJson(Map<String, dynamic> json) =>
      _$TimerCanceledEventAttributesFromJson(json);
}

/// Provides the details of the <code>TimerFired</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TimerFiredEventAttributes {
  /// The ID of the <code>TimerStarted</code> event that was recorded when this
  /// timer was started. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'startedEventId')
  final int startedEventId;

  /// The unique ID of the timer that fired.
  @_s.JsonKey(name: 'timerId')
  final String timerId;

  TimerFiredEventAttributes({
    @_s.required this.startedEventId,
    @_s.required this.timerId,
  });
  factory TimerFiredEventAttributes.fromJson(Map<String, dynamic> json) =>
      _$TimerFiredEventAttributesFromJson(json);
}

/// Provides the details of the <code>TimerStarted</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TimerStartedEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>StartTimer</code> decision for this
  /// activity task. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The duration of time after which the timer fires.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>.
  @_s.JsonKey(name: 'startToFireTimeout')
  final String startToFireTimeout;

  /// The unique ID of the timer that was started.
  @_s.JsonKey(name: 'timerId')
  final String timerId;

  /// Data attached to the event that can be used by the decider in subsequent
  /// workflow tasks.
  @_s.JsonKey(name: 'control')
  final String control;

  TimerStartedEventAttributes({
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.startToFireTimeout,
    @_s.required this.timerId,
    this.control,
  });
  factory TimerStartedEventAttributes.fromJson(Map<String, dynamic> json) =>
      _$TimerStartedEventAttributesFromJson(json);
}

/// Represents a workflow execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WorkflowExecution {
  /// A system-generated unique identifier for the workflow execution.
  @_s.JsonKey(name: 'runId')
  final String runId;

  /// The user defined identifier associated with the workflow execution.
  @_s.JsonKey(name: 'workflowId')
  final String workflowId;

  WorkflowExecution({
    @_s.required this.runId,
    @_s.required this.workflowId,
  });
  factory WorkflowExecution.fromJson(Map<String, dynamic> json) =>
      _$WorkflowExecutionFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowExecutionToJson(this);
}

enum WorkflowExecutionCancelRequestedCause {
  @_s.JsonValue('CHILD_POLICY_APPLIED')
  childPolicyApplied,
}

/// Provides the details of the <code>WorkflowExecutionCancelRequested</code>
/// event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowExecutionCancelRequestedEventAttributes {
  /// If set, indicates that the request to cancel the workflow execution was
  /// automatically generated, and specifies the cause. This happens if the parent
  /// workflow execution times out or is terminated, and the child policy is set
  /// to cancel child executions.
  @_s.JsonKey(name: 'cause')
  final WorkflowExecutionCancelRequestedCause cause;

  /// The ID of the <code>RequestCancelExternalWorkflowExecutionInitiated</code>
  /// event corresponding to the
  /// <code>RequestCancelExternalWorkflowExecution</code> decision to cancel this
  /// workflow execution.The source event with this ID can be found in the history
  /// of the source workflow execution. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'externalInitiatedEventId')
  final int externalInitiatedEventId;

  /// The external workflow execution for which the cancellation was requested.
  @_s.JsonKey(name: 'externalWorkflowExecution')
  final WorkflowExecution externalWorkflowExecution;

  WorkflowExecutionCancelRequestedEventAttributes({
    this.cause,
    this.externalInitiatedEventId,
    this.externalWorkflowExecution,
  });
  factory WorkflowExecutionCancelRequestedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$WorkflowExecutionCancelRequestedEventAttributesFromJson(json);
}

/// Provides the details of the <code>WorkflowExecutionCanceled</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowExecutionCanceledEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>CancelWorkflowExecution</code>
  /// decision for this cancellation request. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The details of the cancellation.
  @_s.JsonKey(name: 'details')
  final String details;

  WorkflowExecutionCanceledEventAttributes({
    @_s.required this.decisionTaskCompletedEventId,
    this.details,
  });
  factory WorkflowExecutionCanceledEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$WorkflowExecutionCanceledEventAttributesFromJson(json);
}

/// Provides the details of the <code>WorkflowExecutionCompleted</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowExecutionCompletedEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>CompleteWorkflowExecution</code>
  /// decision to complete this execution. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The result produced by the workflow execution upon successful completion.
  @_s.JsonKey(name: 'result')
  final String result;

  WorkflowExecutionCompletedEventAttributes({
    @_s.required this.decisionTaskCompletedEventId,
    this.result,
  });
  factory WorkflowExecutionCompletedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$WorkflowExecutionCompletedEventAttributesFromJson(json);
}

/// The configuration settings for a workflow execution including timeout
/// values, tasklist etc. These configuration settings are determined from the
/// defaults specified when registering the workflow type and those specified
/// when starting the workflow execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowExecutionConfiguration {
  /// The policy to use for the child workflow executions if this workflow
  /// execution is terminated, by calling the <a>TerminateWorkflowExecution</a>
  /// action explicitly or due to an expired timeout.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'childPolicy')
  final ChildPolicy childPolicy;

  /// The total duration for this workflow execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'executionStartToCloseTimeout')
  final String executionStartToCloseTimeout;

  /// The task list used for the decision tasks generated for this workflow
  /// execution.
  @_s.JsonKey(name: 'taskList')
  final TaskList taskList;

  /// The maximum duration allowed for decision tasks for this workflow execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'taskStartToCloseTimeout')
  final String taskStartToCloseTimeout;

  /// The IAM role attached to the child workflow execution.
  @_s.JsonKey(name: 'lambdaRole')
  final String lambdaRole;

  /// The priority assigned to decision tasks for this workflow execution. Valid
  /// values are integers that range from Java's <code>Integer.MIN_VALUE</code>
  /// (-2147483648) to <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers
  /// indicate higher priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  @_s.JsonKey(name: 'taskPriority')
  final String taskPriority;

  WorkflowExecutionConfiguration({
    @_s.required this.childPolicy,
    @_s.required this.executionStartToCloseTimeout,
    @_s.required this.taskList,
    @_s.required this.taskStartToCloseTimeout,
    this.lambdaRole,
    this.taskPriority,
  });
  factory WorkflowExecutionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$WorkflowExecutionConfigurationFromJson(json);
}

/// Provides the details of the <code>WorkflowExecutionContinuedAsNew</code>
/// event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowExecutionContinuedAsNewEventAttributes {
  /// The policy to use for the child workflow executions of the new execution if
  /// it is terminated by calling the <a>TerminateWorkflowExecution</a> action
  /// explicitly or due to an expired timeout.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'childPolicy')
  final ChildPolicy childPolicy;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the
  /// <code>ContinueAsNewWorkflowExecution</code> decision that started this
  /// execution. This information can be useful for diagnosing problems by tracing
  /// back the chain of events leading up to this event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The <code>runId</code> of the new workflow execution.
  @_s.JsonKey(name: 'newExecutionRunId')
  final String newExecutionRunId;

  /// The task list to use for the decisions of the new (continued) workflow
  /// execution.
  @_s.JsonKey(name: 'taskList')
  final TaskList taskList;

  /// The workflow type of this execution.
  @_s.JsonKey(name: 'workflowType')
  final WorkflowType workflowType;

  /// The total duration allowed for the new workflow execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'executionStartToCloseTimeout')
  final String executionStartToCloseTimeout;

  /// The input provided to the new workflow execution.
  @_s.JsonKey(name: 'input')
  final String input;

  /// The IAM role to attach to the new (continued) workflow execution.
  @_s.JsonKey(name: 'lambdaRole')
  final String lambdaRole;

  /// The list of tags associated with the new workflow execution.
  @_s.JsonKey(name: 'tagList')
  final List<String> tagList;

  /// The priority of the task to use for the decisions of the new (continued)
  /// workflow execution.
  @_s.JsonKey(name: 'taskPriority')
  final String taskPriority;

  /// The maximum duration of decision tasks for the new workflow execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'taskStartToCloseTimeout')
  final String taskStartToCloseTimeout;

  WorkflowExecutionContinuedAsNewEventAttributes({
    @_s.required this.childPolicy,
    @_s.required this.decisionTaskCompletedEventId,
    @_s.required this.newExecutionRunId,
    @_s.required this.taskList,
    @_s.required this.workflowType,
    this.executionStartToCloseTimeout,
    this.input,
    this.lambdaRole,
    this.tagList,
    this.taskPriority,
    this.taskStartToCloseTimeout,
  });
  factory WorkflowExecutionContinuedAsNewEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$WorkflowExecutionContinuedAsNewEventAttributesFromJson(json);
}

/// Contains the count of workflow executions returned from
/// <a>CountOpenWorkflowExecutions</a> or <a>CountClosedWorkflowExecutions</a>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowExecutionCount {
  /// The number of workflow executions.
  @_s.JsonKey(name: 'count')
  final int count;

  /// If set to true, indicates that the actual count was more than the maximum
  /// supported by this API and the count returned is the truncated value.
  @_s.JsonKey(name: 'truncated')
  final bool truncated;

  WorkflowExecutionCount({
    @_s.required this.count,
    this.truncated,
  });
  factory WorkflowExecutionCount.fromJson(Map<String, dynamic> json) =>
      _$WorkflowExecutionCountFromJson(json);
}

/// Contains details about a workflow execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowExecutionDetail {
  /// The configuration settings for this workflow execution including timeout
  /// values, tasklist etc.
  @_s.JsonKey(name: 'executionConfiguration')
  final WorkflowExecutionConfiguration executionConfiguration;

  /// Information about the workflow execution.
  @_s.JsonKey(name: 'executionInfo')
  final WorkflowExecutionInfo executionInfo;

  /// The number of tasks for this workflow execution. This includes open and
  /// closed tasks of all types.
  @_s.JsonKey(name: 'openCounts')
  final WorkflowExecutionOpenCounts openCounts;

  /// The time when the last activity task was scheduled for this workflow
  /// execution. You can use this information to determine if the workflow has not
  /// made progress for an unusually long period of time and might require a
  /// corrective action.
  @_s.JsonKey(
      name: 'latestActivityTaskTimestamp',
      fromJson: unixFromJson,
      toJson: unixToJson)
  final DateTime latestActivityTaskTimestamp;

  /// The latest executionContext provided by the decider for this workflow
  /// execution. A decider can provide an executionContext (a free-form string)
  /// when closing a decision task using <a>RespondDecisionTaskCompleted</a>.
  @_s.JsonKey(name: 'latestExecutionContext')
  final String latestExecutionContext;

  WorkflowExecutionDetail({
    @_s.required this.executionConfiguration,
    @_s.required this.executionInfo,
    @_s.required this.openCounts,
    this.latestActivityTaskTimestamp,
    this.latestExecutionContext,
  });
  factory WorkflowExecutionDetail.fromJson(Map<String, dynamic> json) =>
      _$WorkflowExecutionDetailFromJson(json);
}

/// Provides the details of the <code>WorkflowExecutionFailed</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowExecutionFailedEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>FailWorkflowExecution</code>
  /// decision to fail this execution. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  @_s.JsonKey(name: 'decisionTaskCompletedEventId')
  final int decisionTaskCompletedEventId;

  /// The details of the failure.
  @_s.JsonKey(name: 'details')
  final String details;

  /// The descriptive reason provided for the failure.
  @_s.JsonKey(name: 'reason')
  final String reason;

  WorkflowExecutionFailedEventAttributes({
    @_s.required this.decisionTaskCompletedEventId,
    this.details,
    this.reason,
  });
  factory WorkflowExecutionFailedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$WorkflowExecutionFailedEventAttributesFromJson(json);
}

/// Used to filter the workflow executions in visibility APIs by their
/// <code>workflowId</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class WorkflowExecutionFilter {
  /// The workflowId to pass of match the criteria of this filter.
  @_s.JsonKey(name: 'workflowId')
  final String workflowId;

  WorkflowExecutionFilter({
    @_s.required this.workflowId,
  });
  Map<String, dynamic> toJson() => _$WorkflowExecutionFilterToJson(this);
}

/// Contains information about a workflow execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowExecutionInfo {
  /// The workflow execution this information is about.
  @_s.JsonKey(name: 'execution')
  final WorkflowExecution execution;

  /// The current status of the execution.
  @_s.JsonKey(name: 'executionStatus')
  final ExecutionStatus executionStatus;

  /// The time when the execution was started.
  @_s.JsonKey(
      name: 'startTimestamp', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime startTimestamp;

  /// The type of the workflow execution.
  @_s.JsonKey(name: 'workflowType')
  final WorkflowType workflowType;

  /// Set to true if a cancellation is requested for this workflow execution.
  @_s.JsonKey(name: 'cancelRequested')
  final bool cancelRequested;

  /// If the execution status is closed then this specifies how the execution was
  /// closed:
  ///
  /// <ul>
  /// <li>
  /// <code>COMPLETED</code> – the execution was successfully completed.
  /// </li>
  /// <li>
  /// <code>CANCELED</code> – the execution was canceled.Cancellation allows the
  /// implementation to gracefully clean up before the execution is closed.
  /// </li>
  /// <li>
  /// <code>TERMINATED</code> – the execution was force terminated.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – the execution failed to complete.
  /// </li>
  /// <li>
  /// <code>TIMED_OUT</code> – the execution did not complete in the alloted time
  /// and was automatically timed out.
  /// </li>
  /// <li>
  /// <code>CONTINUED_AS_NEW</code> – the execution is logically continued. This
  /// means the current execution was completed and a new execution was started to
  /// carry on the workflow.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'closeStatus')
  final CloseStatus closeStatus;

  /// The time when the workflow execution was closed. Set only if the execution
  /// status is CLOSED.
  @_s.JsonKey(
      name: 'closeTimestamp', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime closeTimestamp;

  /// If this workflow execution is a child of another execution then contains the
  /// workflow execution that started this execution.
  @_s.JsonKey(name: 'parent')
  final WorkflowExecution parent;

  /// The list of tags associated with the workflow execution. Tags can be used to
  /// identify and list workflow executions of interest through the visibility
  /// APIs. A workflow execution can have a maximum of 5 tags.
  @_s.JsonKey(name: 'tagList')
  final List<String> tagList;

  WorkflowExecutionInfo({
    @_s.required this.execution,
    @_s.required this.executionStatus,
    @_s.required this.startTimestamp,
    @_s.required this.workflowType,
    this.cancelRequested,
    this.closeStatus,
    this.closeTimestamp,
    this.parent,
    this.tagList,
  });
  factory WorkflowExecutionInfo.fromJson(Map<String, dynamic> json) =>
      _$WorkflowExecutionInfoFromJson(json);
}

/// Contains a paginated list of information about workflow executions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowExecutionInfos {
  /// The list of workflow information structures.
  @_s.JsonKey(name: 'executionInfos')
  final List<WorkflowExecutionInfo> executionInfos;

  /// If a <code>NextPageToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the call
  /// again using the returned token in <code>nextPageToken</code>. Keep all other
  /// arguments unchanged.
  ///
  /// The configured <code>maximumPageSize</code> determines how many results can
  /// be returned in a single call.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  WorkflowExecutionInfos({
    @_s.required this.executionInfos,
    this.nextPageToken,
  });
  factory WorkflowExecutionInfos.fromJson(Map<String, dynamic> json) =>
      _$WorkflowExecutionInfosFromJson(json);
}

/// Contains the counts of open tasks, child workflow executions and timers for
/// a workflow execution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowExecutionOpenCounts {
  /// The count of activity tasks whose status is <code>OPEN</code>.
  @_s.JsonKey(name: 'openActivityTasks')
  final int openActivityTasks;

  /// The count of child workflow executions whose status is <code>OPEN</code>.
  @_s.JsonKey(name: 'openChildWorkflowExecutions')
  final int openChildWorkflowExecutions;

  /// The count of decision tasks whose status is OPEN. A workflow execution can
  /// have at most one open decision task.
  @_s.JsonKey(name: 'openDecisionTasks')
  final int openDecisionTasks;

  /// The count of timers started by this workflow execution that have not fired
  /// yet.
  @_s.JsonKey(name: 'openTimers')
  final int openTimers;

  /// The count of Lambda tasks whose status is <code>OPEN</code>.
  @_s.JsonKey(name: 'openLambdaFunctions')
  final int openLambdaFunctions;

  WorkflowExecutionOpenCounts({
    @_s.required this.openActivityTasks,
    @_s.required this.openChildWorkflowExecutions,
    @_s.required this.openDecisionTasks,
    @_s.required this.openTimers,
    this.openLambdaFunctions,
  });
  factory WorkflowExecutionOpenCounts.fromJson(Map<String, dynamic> json) =>
      _$WorkflowExecutionOpenCountsFromJson(json);
}

/// Provides the details of the <code>WorkflowExecutionSignaled</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowExecutionSignaledEventAttributes {
  /// The name of the signal received. The decider can use the signal name and
  /// inputs to determine how to the process the signal.
  @_s.JsonKey(name: 'signalName')
  final String signalName;

  /// The ID of the <code>SignalExternalWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>SignalExternalWorkflow</code> decision to signal
  /// this workflow execution.The source event with this ID can be found in the
  /// history of the source workflow execution. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event. This field is set only if the signal was initiated by another
  /// workflow execution.
  @_s.JsonKey(name: 'externalInitiatedEventId')
  final int externalInitiatedEventId;

  /// The workflow execution that sent the signal. This is set only of the signal
  /// was sent by another workflow execution.
  @_s.JsonKey(name: 'externalWorkflowExecution')
  final WorkflowExecution externalWorkflowExecution;

  /// The inputs provided with the signal. The decider can use the signal name and
  /// inputs to determine how to process the signal.
  @_s.JsonKey(name: 'input')
  final String input;

  WorkflowExecutionSignaledEventAttributes({
    @_s.required this.signalName,
    this.externalInitiatedEventId,
    this.externalWorkflowExecution,
    this.input,
  });
  factory WorkflowExecutionSignaledEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$WorkflowExecutionSignaledEventAttributesFromJson(json);
}

/// Provides details of <code>WorkflowExecutionStarted</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowExecutionStartedEventAttributes {
  /// The policy to use for the child workflow executions if this workflow
  /// execution is terminated, by calling the <a>TerminateWorkflowExecution</a>
  /// action explicitly or due to an expired timeout.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'childPolicy')
  final ChildPolicy childPolicy;

  /// The name of the task list for scheduling the decision tasks for this
  /// workflow execution.
  @_s.JsonKey(name: 'taskList')
  final TaskList taskList;

  /// The workflow type of this execution.
  @_s.JsonKey(name: 'workflowType')
  final WorkflowType workflowType;

  /// If this workflow execution was started due to a
  /// <code>ContinueAsNewWorkflowExecution</code> decision, then it contains the
  /// <code>runId</code> of the previous workflow execution that was closed and
  /// continued as this execution.
  @_s.JsonKey(name: 'continuedExecutionRunId')
  final String continuedExecutionRunId;

  /// The maximum duration for this workflow execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'executionStartToCloseTimeout')
  final String executionStartToCloseTimeout;

  /// The input provided to the workflow execution.
  @_s.JsonKey(name: 'input')
  final String input;

  /// The IAM role attached to the workflow execution.
  @_s.JsonKey(name: 'lambdaRole')
  final String lambdaRole;

  /// The ID of the <code>StartChildWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to start this workflow execution. The source event with this
  /// ID can be found in the history of the source workflow execution. This
  /// information can be useful for diagnosing problems by tracing back the chain
  /// of events leading up to this event.
  @_s.JsonKey(name: 'parentInitiatedEventId')
  final int parentInitiatedEventId;

  /// The source workflow execution that started this workflow execution. The
  /// member isn't set if the workflow execution was not started by a workflow.
  @_s.JsonKey(name: 'parentWorkflowExecution')
  final WorkflowExecution parentWorkflowExecution;

  /// The list of tags associated with this workflow execution. An execution can
  /// have up to 5 tags.
  @_s.JsonKey(name: 'tagList')
  final List<String> tagList;

  /// The priority of the decision tasks in the workflow execution.
  @_s.JsonKey(name: 'taskPriority')
  final String taskPriority;

  /// The maximum duration of decision tasks for this workflow type.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'taskStartToCloseTimeout')
  final String taskStartToCloseTimeout;

  WorkflowExecutionStartedEventAttributes({
    @_s.required this.childPolicy,
    @_s.required this.taskList,
    @_s.required this.workflowType,
    this.continuedExecutionRunId,
    this.executionStartToCloseTimeout,
    this.input,
    this.lambdaRole,
    this.parentInitiatedEventId,
    this.parentWorkflowExecution,
    this.tagList,
    this.taskPriority,
    this.taskStartToCloseTimeout,
  });
  factory WorkflowExecutionStartedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$WorkflowExecutionStartedEventAttributesFromJson(json);
}

enum WorkflowExecutionTerminatedCause {
  @_s.JsonValue('CHILD_POLICY_APPLIED')
  childPolicyApplied,
  @_s.JsonValue('EVENT_LIMIT_EXCEEDED')
  eventLimitExceeded,
  @_s.JsonValue('OPERATOR_INITIATED')
  operatorInitiated,
}

/// Provides the details of the <code>WorkflowExecutionTerminated</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowExecutionTerminatedEventAttributes {
  /// The policy used for the child workflow executions of this workflow
  /// execution.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'childPolicy')
  final ChildPolicy childPolicy;

  /// If set, indicates that the workflow execution was automatically terminated,
  /// and specifies the cause. This happens if the parent workflow execution times
  /// out or is terminated and the child policy is set to terminate child
  /// executions.
  @_s.JsonKey(name: 'cause')
  final WorkflowExecutionTerminatedCause cause;

  /// The details provided for the termination.
  @_s.JsonKey(name: 'details')
  final String details;

  /// The reason provided for the termination.
  @_s.JsonKey(name: 'reason')
  final String reason;

  WorkflowExecutionTerminatedEventAttributes({
    @_s.required this.childPolicy,
    this.cause,
    this.details,
    this.reason,
  });
  factory WorkflowExecutionTerminatedEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$WorkflowExecutionTerminatedEventAttributesFromJson(json);
}

/// Provides the details of the <code>WorkflowExecutionTimedOut</code> event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowExecutionTimedOutEventAttributes {
  /// The policy used for the child workflow executions of this workflow
  /// execution.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'childPolicy')
  final ChildPolicy childPolicy;

  /// The type of timeout that caused this event.
  @_s.JsonKey(name: 'timeoutType')
  final WorkflowExecutionTimeoutType timeoutType;

  WorkflowExecutionTimedOutEventAttributes({
    @_s.required this.childPolicy,
    @_s.required this.timeoutType,
  });
  factory WorkflowExecutionTimedOutEventAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$WorkflowExecutionTimedOutEventAttributesFromJson(json);
}

enum WorkflowExecutionTimeoutType {
  @_s.JsonValue('START_TO_CLOSE')
  startToClose,
}

/// Represents a workflow type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WorkflowType {
  /// The name of the workflow type.
  /// <note>
  /// The combination of workflow type name and version must be unique with in a
  /// domain.
  /// </note>
  @_s.JsonKey(name: 'name')
  final String name;

  /// The version of the workflow type.
  /// <note>
  /// The combination of workflow type name and version must be unique with in a
  /// domain.
  /// </note>
  @_s.JsonKey(name: 'version')
  final String version;

  WorkflowType({
    @_s.required this.name,
    @_s.required this.version,
  });
  factory WorkflowType.fromJson(Map<String, dynamic> json) =>
      _$WorkflowTypeFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowTypeToJson(this);
}

/// The configuration settings of a workflow type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowTypeConfiguration {
  /// The default policy to use for the child workflow executions when a workflow
  /// execution of this type is terminated, by calling the
  /// <a>TerminateWorkflowExecution</a> action explicitly or due to an expired
  /// timeout. This default can be overridden when starting a workflow execution
  /// using the <a>StartWorkflowExecution</a> action or the
  /// <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'defaultChildPolicy')
  final ChildPolicy defaultChildPolicy;

  /// The default maximum duration, specified when registering the workflow type,
  /// for executions of this workflow type. This default can be overridden when
  /// starting a workflow execution using the <a>StartWorkflowExecution</a> action
  /// or the <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'defaultExecutionStartToCloseTimeout')
  final String defaultExecutionStartToCloseTimeout;

  /// The default IAM role attached to this workflow type.
  /// <note>
  /// Executions of this workflow type need IAM roles to invoke Lambda functions.
  /// If you don't specify an IAM role when starting this workflow type, the
  /// default Lambda role is attached to the execution. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html">https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html</a>
  /// in the <i>Amazon SWF Developer Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'defaultLambdaRole')
  final String defaultLambdaRole;

  /// The default task list, specified when registering the workflow type, for
  /// decisions tasks scheduled for workflow executions of this type. This default
  /// can be overridden when starting a workflow execution using the
  /// <a>StartWorkflowExecution</a> action or the
  /// <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  @_s.JsonKey(name: 'defaultTaskList')
  final TaskList defaultTaskList;

  /// The default task priority, specified when registering the workflow type, for
  /// all decision tasks of this workflow type. This default can be overridden
  /// when starting a workflow execution using the <a>StartWorkflowExecution</a>
  /// action or the <code>StartChildWorkflowExecution</code> decision.
  ///
  /// Valid values are integers that range from Java's
  /// <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate higher
  /// priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  @_s.JsonKey(name: 'defaultTaskPriority')
  final String defaultTaskPriority;

  /// The default maximum duration, specified when registering the workflow type,
  /// that a decision task for executions of this workflow type might take before
  /// returning completion or failure. If the task doesn'tdo close in the
  /// specified time then the task is automatically timed out and rescheduled. If
  /// the decider eventually reports a completion or failure, it is ignored. This
  /// default can be overridden when starting a workflow execution using the
  /// <a>StartWorkflowExecution</a> action or the
  /// <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  @_s.JsonKey(name: 'defaultTaskStartToCloseTimeout')
  final String defaultTaskStartToCloseTimeout;

  WorkflowTypeConfiguration({
    this.defaultChildPolicy,
    this.defaultExecutionStartToCloseTimeout,
    this.defaultLambdaRole,
    this.defaultTaskList,
    this.defaultTaskPriority,
    this.defaultTaskStartToCloseTimeout,
  });
  factory WorkflowTypeConfiguration.fromJson(Map<String, dynamic> json) =>
      _$WorkflowTypeConfigurationFromJson(json);
}

/// Contains details about a workflow type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowTypeDetail {
  /// Configuration settings of the workflow type registered through
  /// <a>RegisterWorkflowType</a>
  @_s.JsonKey(name: 'configuration')
  final WorkflowTypeConfiguration configuration;

  /// General information about the workflow type.
  ///
  /// The status of the workflow type (returned in the WorkflowTypeInfo structure)
  /// can be one of the following.
  ///
  /// <ul>
  /// <li>
  /// <code>REGISTERED</code> – The type is registered and available. Workers
  /// supporting this type should be running.
  /// </li>
  /// <li>
  /// <code>DEPRECATED</code> – The type was deprecated using
  /// <a>DeprecateWorkflowType</a>, but is still in use. You should keep workers
  /// supporting this type running. You cannot create new workflow executions of
  /// this type.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'typeInfo')
  final WorkflowTypeInfo typeInfo;

  WorkflowTypeDetail({
    @_s.required this.configuration,
    @_s.required this.typeInfo,
  });
  factory WorkflowTypeDetail.fromJson(Map<String, dynamic> json) =>
      _$WorkflowTypeDetailFromJson(json);
}

/// Used to filter workflow execution query results by type. Each parameter, if
/// specified, defines a rule that must be satisfied by each returned result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class WorkflowTypeFilter {
  /// Name of the workflow type.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Version of the workflow type.
  @_s.JsonKey(name: 'version')
  final String version;

  WorkflowTypeFilter({
    @_s.required this.name,
    this.version,
  });
  Map<String, dynamic> toJson() => _$WorkflowTypeFilterToJson(this);
}

/// Contains information about a workflow type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowTypeInfo {
  /// The date when this type was registered.
  @_s.JsonKey(name: 'creationDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationDate;

  /// The current status of the workflow type.
  @_s.JsonKey(name: 'status')
  final RegistrationStatus status;

  /// The workflow type this information is about.
  @_s.JsonKey(name: 'workflowType')
  final WorkflowType workflowType;

  /// If the type is in deprecated state, then it is set to the date when the type
  /// was deprecated.
  @_s.JsonKey(
      name: 'deprecationDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime deprecationDate;

  /// The description of the type registered through <a>RegisterWorkflowType</a>.
  @_s.JsonKey(name: 'description')
  final String description;

  WorkflowTypeInfo({
    @_s.required this.creationDate,
    @_s.required this.status,
    @_s.required this.workflowType,
    this.deprecationDate,
    this.description,
  });
  factory WorkflowTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$WorkflowTypeInfoFromJson(json);
}

/// Contains a paginated list of information structures about workflow types.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowTypeInfos {
  /// The list of workflow type information.
  @_s.JsonKey(name: 'typeInfos')
  final List<WorkflowTypeInfo> typeInfos;

  /// If a <code>NextPageToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the call
  /// again using the returned token in <code>nextPageToken</code>. Keep all other
  /// arguments unchanged.
  ///
  /// The configured <code>maximumPageSize</code> determines how many results can
  /// be returned in a single call.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  WorkflowTypeInfos({
    @_s.required this.typeInfos,
    this.nextPageToken,
  });
  factory WorkflowTypeInfos.fromJson(Map<String, dynamic> json) =>
      _$WorkflowTypeInfosFromJson(json);
}

class DefaultUndefinedFault extends _s.GenericAwsException {
  DefaultUndefinedFault({String type, String message})
      : super(type: type, code: 'DefaultUndefinedFault', message: message);
}

class DomainAlreadyExistsFault extends _s.GenericAwsException {
  DomainAlreadyExistsFault({String type, String message})
      : super(type: type, code: 'DomainAlreadyExistsFault', message: message);
}

class DomainDeprecatedFault extends _s.GenericAwsException {
  DomainDeprecatedFault({String type, String message})
      : super(type: type, code: 'DomainDeprecatedFault', message: message);
}

class LimitExceededFault extends _s.GenericAwsException {
  LimitExceededFault({String type, String message})
      : super(type: type, code: 'LimitExceededFault', message: message);
}

class OperationNotPermittedFault extends _s.GenericAwsException {
  OperationNotPermittedFault({String type, String message})
      : super(type: type, code: 'OperationNotPermittedFault', message: message);
}

class TooManyTagsFault extends _s.GenericAwsException {
  TooManyTagsFault({String type, String message})
      : super(type: type, code: 'TooManyTagsFault', message: message);
}

class TypeAlreadyExistsFault extends _s.GenericAwsException {
  TypeAlreadyExistsFault({String type, String message})
      : super(type: type, code: 'TypeAlreadyExistsFault', message: message);
}

class TypeDeprecatedFault extends _s.GenericAwsException {
  TypeDeprecatedFault({String type, String message})
      : super(type: type, code: 'TypeDeprecatedFault', message: message);
}

class UnknownResourceFault extends _s.GenericAwsException {
  UnknownResourceFault({String type, String message})
      : super(type: type, code: 'UnknownResourceFault', message: message);
}

class WorkflowExecutionAlreadyStartedFault extends _s.GenericAwsException {
  WorkflowExecutionAlreadyStartedFault({String type, String message})
      : super(
            type: type,
            code: 'WorkflowExecutionAlreadyStartedFault',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'DefaultUndefinedFault': (type, message) =>
      DefaultUndefinedFault(type: type, message: message),
  'DomainAlreadyExistsFault': (type, message) =>
      DomainAlreadyExistsFault(type: type, message: message),
  'DomainDeprecatedFault': (type, message) =>
      DomainDeprecatedFault(type: type, message: message),
  'LimitExceededFault': (type, message) =>
      LimitExceededFault(type: type, message: message),
  'OperationNotPermittedFault': (type, message) =>
      OperationNotPermittedFault(type: type, message: message),
  'TooManyTagsFault': (type, message) =>
      TooManyTagsFault(type: type, message: message),
  'TypeAlreadyExistsFault': (type, message) =>
      TypeAlreadyExistsFault(type: type, message: message),
  'TypeDeprecatedFault': (type, message) =>
      TypeDeprecatedFault(type: type, message: message),
  'UnknownResourceFault': (type, message) =>
      UnknownResourceFault(type: type, message: message),
  'WorkflowExecutionAlreadyStartedFault': (type, message) =>
      WorkflowExecutionAlreadyStartedFault(type: type, message: message),
};
