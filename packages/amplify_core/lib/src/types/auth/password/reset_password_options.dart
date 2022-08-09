/*
 * Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

/// {@template amplify_common.reset_password_options}
/// The shared reset password options among all Auth plugins.
/// {@endtemplate}
abstract class ResetPasswordOptions {
  /// {@macro amplify_common.reset_password_options}
  const ResetPasswordOptions();

  /// Serialize the object to a map.
  Map<String, Object?> serializeAsMap();
}