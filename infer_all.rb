# coding: utf-8
require './lib/sidekiq'
#require '../type-infer/rdl/lib/rdl'
require 'rdl'
RDL::Config.instance.number_mode = true
require 'types/core'
require 'i18n'

require_relative './lib/sidekiq/worker.rb'
require_relative './lib/sidekiq/api.rb'
require_relative './lib/sidekiq/cli.rb'
require_relative './lib/sidekiq/client.rb'
require_relative './lib/sidekiq/delay.rb'
require_relative './lib/sidekiq/exception_handler.rb'
require_relative './lib/sidekiq/fetch.rb'
require_relative './lib/sidekiq/job_logger.rb'
require_relative './lib/sidekiq/job_retry.rb'
require_relative './lib/sidekiq/launcher.rb'
require_relative './lib/sidekiq/logger.rb'
require_relative './lib/sidekiq/manager.rb'
require_relative './lib/sidekiq/monitor.rb'
require_relative './lib/sidekiq/paginator.rb'
require_relative './lib/sidekiq/processor.rb'
require_relative './lib/sidekiq/redis_connection.rb'
require_relative './lib/sidekiq/scheduled.rb'
require_relative './lib/sidekiq/testing.rb'
require_relative './lib/sidekiq/util.rb'
require_relative './lib/sidekiq/web.rb'



require_relative './lib/sidekiq/extensions/action_mailer.rb'
require_relative './lib/sidekiq/extensions/active_record.rb'
require_relative './lib/sidekiq/extensions/class_methods.rb'
require_relative './lib/sidekiq/extensions/generic_proxy.rb'
require_relative './lib/sidekiq/middleware/chain.rb'
require_relative './lib/sidekiq/middleware/i18n.rb'
require_relative './lib/sidekiq/web/action.rb'
require_relative './lib/sidekiq/web/application.rb'
require_relative './lib/sidekiq/web/helpers.rb'
require_relative './lib/sidekiq/web/router.rb'


RDL.no_infer_meth Sidekiq::Job, :safe_load ## expression kind unsupported
RDL.no_infer_meth Sidekiq::JobSet, :delete_by_jid ## break kind unsupported
RDL.no_infer_meth Sidekiq::RetrySet, :retry_all ## unsupported use of to_proc
RDL.no_infer_meth Sidekiq::RetrySet, :kill_all  ## unsupported use of to_proc
RDL.no_infer_meth Sidekiq::DeadSet, :retry_all ## unsupported use of to_proc

RDL.no_infer_meth Sidekiq::SortedSet, :scan ## POTENTIAL BUG: first argument to SortedEntry.new is self, of type SortedSet
# This value is assigned to @parent (line 454), which has `delete_by_value` called on it (line 463)
# `delete_by_value` is not defined for the SortedSet class.
# It is, however, defined by JobSet, a subclass of SortedSet.
# So either this is a bug, or it is OK because it may only be used with subclasses

RDL.infer_file "./lib/sidekiq/api.rb"



RDL.no_infer_meth Sidekiq::CLI, :rails_app? ## unsupported use of defined?
RDL.no_infer_meth Sidekiq::CLI, :run ## refers to Rails
RDL.no_infer_meth Sidekiq::CLI, :boot_system ## refers to Rails
RDL.no_infer_meth Sidekiq::CLI, :default_tag ## refers to Rails
RDL.no_infer_meth Sidekiq::CLI, :parse_config ## use of respond_to
RDL.no_infer_meth Sidekiq::CLI, :parse_queues ## splat issue
RDL.infer_file "./lib/sidekiq/cli.rb"


#RDL.no_infer_meth Sidekiq::Client, :normalize_item ## use of respond_to
RDL.no_infer_meth Sidekiq::Client, :normalized_hash ## use of respond_to
RDL.no_infer_meth Sidekiq::Client, 'self.enqueue' ## client_push is mixin method, raises error with struct_to_nominal
RDL.no_infer_meth Sidekiq::Client, 'self.enqueue_to' ## client_push is mixin method, raises error with struct_to_nominal
RDL.no_infer_meth Sidekiq::Client, 'self.enqueue_to_in' ## client_push is mixin method, raises error with struct_to_nominal
RDL.infer_file "./lib/sidekiq/client.rb"


RDL.no_infer_meth Sidekiq::Extensions, 'self.enable_delay!' ## use of defined? for ActiveSupport
RDL.no_infer_meth Sidekiq::Extensions::PsychAutoload, 'resolve_class' ## use of super in mixin
RDL.infer_file "./lib/sidekiq/delay.rb"


RDL.infer_file "./lib/sidekiq/exception_handler.rb"

RDL.infer_file "./lib/sidekiq/fetch.rb"

RDL.infer_file "./lib/sidekiq/job_logger.rb"


RDL.no_infer_meth Sidekiq::JobRetry, :local ## mixin issues
RDL.no_infer_meth Sidekiq::JobRetry, :delay_for ## mixin issues (struct_to_nominal)
RDL.no_infer_meth Sidekiq::JobRetry, :retry_in ## mixin issues (struct_to_nominal)
RDL.no_infer_meth Sidekiq::JobRetry, :retries_exhausted ## mixin issues (struct_to_nominal)
RDL.infer_file "./lib/sidekiq/job_retry.rb"


RDL.no_infer_meth Sidekiq::Launcher, :❤ ## POTENTIAL BUG: calls `dup` method which overrides Object method with different type (returns Hash instead of self)
RDL.infer_file "./lib/sidekiq/launcher.rb"

RDL.no_infer_meth Sidekiq::LoggingUtils, :level ## calls super from a module
RDL.no_infer_meth Sidekiq::LoggingUtils, :add ## POTENTIALL BUG: no UNKNOWN constant defined
RDL.no_infer_meth Sidekiq::Logger, :initialize ## keyrest args not supported
RDL.infer_file "./lib/sidekiq/logger.rb"


RDL.infer_file "./lib/sidekiq/manager.rb"

RDL.no_infer_meth Sidekiq::Monitor::Status, :queues ## unsupported mlhs arg type
RDL.infer_file "./lib/sidekiq/monitor.rb"

RDL.infer_file "./lib/sidekiq/paginator.rb"

RDL.no_infer_meth Sidekiq::Processor, :process ## POTENTIAL BUG: line 184, there is no variable called e
RDL.no_infer_meth Sidekiq::Processor, :dispatch ## problem of calling #new on Object... don't want to add Object#initialize type because then everything will inherit from it
RDL.infer_file "./lib/sidekiq/processor.rb"


## Below refers to Rails constants that require Rails to be loaded
##RDL.infer_file "./lib/sidekiq/rails.rb"

RDL.no_infer_meth Sidekiq::RedisConnection, 'self.build_client' ## use of `require` inside method
RDL.infer_file "./lib/sidekiq/redis_connection.rb"

RDL.infer_file "./lib/sidekiq/scheduled.rb"

RDL.no_infer_meth Sidekiq::Client, :raw_push ## use of `super` in mixin
RDL.no_infer_meth Sidekiq::TestingClient, :raw_push ## use of `super` in mixin
RDL.no_infer_meth Sidekiq::Worker::ClassMethods, :queue ## POTENTIAL BUG: `get_sidekiq_options` method is defined in Sidekiq::Worker::Options::ClassMethods, which is not available from Sidekiq::Worker::ClassMethods

## POTENTIAL BUG: for all of the below, there is no :to_s method... but maybe this is just a mixin issue?
RDL.no_infer_meth Sidekiq::Worker::ClassMethods, :jobs
RDL.no_infer_meth Sidekiq::Worker::ClassMethods, :clear
RDL.no_infer_meth Sidekiq::Worker::ClassMethods, :drain
RDL.no_infer_meth Sidekiq::Worker::ClassMethods, :perform_one

RDL.no_infer_meth Sidekiq::Worker::ClassMethods, :process_job ## calls new, defined outside mixin

RDL.no_infer_meth Sidekiq::TestingExtensions, :jobs_for ## mixin issue or POTENTIAL BUG for method `jobs`
RDL.infer_file "./lib/sidekiq/testing.rb"


RDL.infer_file "./lib/sidekiq/util.rb"

RDL.no_infer_meth Sidekiq::Web, :using? ## mlhs issue
RDL.no_infer_meth Sidekiq::Web, :build ## POTENTIAL BUG: `map` and `run` methods are undefined in this context. They ARE defined for ::Rack::Builder, but I'm fairly sure block scope doesn't work this way
RDL.no_infer_meth Sidekiq::Web, 'self.inherited' ## very unique case of calling attr accessor methods for a singleton class. This breaks struct_to_nominal as it currently stands
RDL.no_infer_meth Sidekiq::Web, 'self.register' ## POTENTIAL BUG: or maybe not... struct_to_nominal can't find any class with `registered` method
RDL.infer_file "./lib/sidekiq/web.rb"


RDL.no_infer_meth Sidekiq::Worker::Options::ClassMethods, :sidekiq_options ## calls metaprogramming meth
RDL.no_infer_meth Sidekiq::Worker::Options::ClassMethods, :get_sidekiq_options ## calls metaprogramming meth
RDL.no_infer_meth Sidekiq::Worker::Options::ClassMethods, :sidekiq_retry_in ## calls metaprogramming meth
RDL.no_infer_meth Sidekiq::Worker::Options::ClassMethods, :sidekiq_retries_exhausted ## calls metaprogramming meth
RDL.no_infer_meth Sidekiq::Worker::Options::ClassMethods, :sidekiq_class_attribute ## use of instance_eval (metaprogramming)
RDL.no_infer_meth Sidekiq::Worker::ClassMethods, :sidekiq_options ## calling super from a mixin method
RDL.no_infer_meth Sidekiq::Worker::ClassMethods, :client_push ## POTENTIAL BUG: same issue as `queue` method above
RDL.no_infer_meth Sidekiq::Worker::Options, 'self.included' ## struct_to_nominal/mixin issue
RDL.no_infer_meth Sidekiq::Worker::Setter, :perform_async ## struct_to_nominal/mixin issue
RDL.no_infer_meth Sidekiq::Worker::Setter, :perform_in ## struct_to_nominal/mixin issue
RDL.infer_file "./lib/sidekiq/worker.rb"

RDL.no_infer_meth Sidekiq::Extensions::DelayedMailer, :perform # Can't give type cast without ActionMailer objects
RDL.infer_file "./lib/sidekiq/extensions/action_mailer.rb" ## TODO: add back after resolving ileft issue
RDL.infer_file "./lib/sidekiq/extensions/active_record.rb" ## TODO: add back after resolving ileft issue
RDL.infer_file "./lib/sidekiq/extensions/class_methods.rb" ## TODO: add back after resolving ileft issue

RDL.no_infer_meth Sidekiq::Middleware::Chain, :invoke
RDL.infer_file "./lib/sidekiq/middleware/chain.rb"

RDL.infer_file "./lib/sidekiq/middleware/chain.rb"
RDL.infer_file "./lib/sidekiq/middleware/i18n.rb"
RDL.infer_file './lib/sidekiq/web/action.rb'
RDL.no_infer_meth Sidekiq::WebApplication, 'self.run_hooks' # can't type what cast is that's needed
RDL.infer_file './lib/sidekiq/web/application.rb'

#RDL.no_infer_meth Sidekiq::WebHelpers, :strings ## mixin issue
#RDL.no_infer_meth Sidekiq::WebHelpers, :locale_files ## mixin issue
#RDL.infer_file './lib/sidekiq/web/helpers.rb' ## Bunch of mixin issues here.

RDL.infer_file './lib/sidekiq/web/router.rb'

RDL.do_infer :files, num_times: 11
