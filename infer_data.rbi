# typed: strong
module Sidekiq
  class Stats
    # RDL Type: () -> self
    sig { returns(T.self_type) }
    def initialize; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def processed; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def failed; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def scheduled_size; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def retry_size; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def dead_size; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def enqueued; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def processes_size; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def workers_size; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def default_queue_latency; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def queues; end

    # RDL Type: () -> { processed: Number, failed: Number, scheduled_size: XXX, retry_size: XXX, dead_size: XXX, processes_size: XXX, default_queue_latency: Number, workers_size: XXX, enqueued: XXX }
    sig { returns(T.untyped) }
    def fetch_stats!; end

    # RDL Type: (*XXX) -> XXX
    sig { params(stats: T.untyped).returns(T.untyped) }
    def reset(*stats); end

    # RDL Type: (XXX) -> XXX
    sig { params(s: T.untyped).returns(T.untyped) }
    def stat(s); end

    class Queues
      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def lengths; end
    end

    class History
      # RDL Type: (XXX, ?((XXX or XXX))) -> self
      sig { params(days_previous: T.untyped, start_date: T.untyped).returns(T.self_type) }
      def initialize(days_previous, start_date = nil); end

      # RDL Type: () -> Hash<XXX, Number>
      sig { returns(T::Hash[T.untyped, Integer]) }
      def processed; end

      # RDL Type: () -> Hash<XXX, Number>
      sig { returns(T::Hash[T.untyped, Integer]) }
      def failed; end

      # RDL Type: (XXX) -> Hash<XXX, Number>
      sig { params(stat: T.untyped).returns(T::Hash[T.untyped, Integer]) }
      def date_stat_hash(stat); end
    end
  end

  class Queue
    # RDL Type: (?String) -> self
    sig { params(name: String).returns(T.self_type) }
    def initialize(name = nil); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def size; end

    # RDL Type: () -> false
    sig { returns(FalseClass) }
    def paused?; end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def latency; end

    # RDL Type: () {(Sidekiq::Job) -> XXX} -> XXX
    sig { returns(T.untyped) }
    def each; end

    # RDL Type: (Number) -> XXX
    sig { params(jid: Integer).returns(T.untyped) }
    def find_job(jid); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def clear; end
  end

  class Job
    # RDL Type: (([ []: (String) -> XXX ] and [ is_a?: (Class) -> XXX ]), ?String) -> self
    sig { params(item: T.untyped, queue_name: String).returns(T.self_type) }
    def initialize(item, queue_name = nil); end

    # RDL Type: ([ []: (String) -> XXX ]) -> Hash<String, XXX>
    sig { params(item: T.untyped).returns(T::Hash[String, T.untyped]) }
    def parse(item); end

    # RDL Type: () -> nil
    sig { void }
    def klass; end

    # RDL Type: () -> nil
    sig { void }
    def display_class; end

    # RDL Type: () -> Array<XXX>
    sig { returns(T::Array[T.untyped]) }
    def display_args; end

    # RDL Type: () -> Array<(String or XXX)>
    sig { returns(T::Array[T.untyped]) }
    def args; end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def jid; end

    # RDL Type: () -> Time
    sig { returns(Time) }
    def enqueued_at; end

    # RDL Type: () -> Time
    sig { returns(Time) }
    def created_at; end

    # RDL Type: () -> Array<XXX>
    sig { returns(T::Array[T.untyped]) }
    def tags; end

    # RDL Type: () -> Object
    sig { returns(Object) }
    def error_backtrace; end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def latency; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def delete; end

    # RDL Type: (String) -> nil
    sig { params(name: String).void }
    def [](name); end

    # RDL Type: (String) -> Object
    sig { params(backtrace: String).returns(Object) }
    def uncompress_backtrace(backtrace); end
  end

  class SortedEntry
    # RDL Type: (Sidekiq::JobSet, XXX, ([ []: (String) -> XXX ] and [ is_a?: (Class) -> XXX ])) -> self
    sig { params(parent: Sidekiq::JobSet, score: T.untyped, item: T.untyped).returns(T.self_type) }
    def initialize(parent, score, item); end

    # RDL Type: () -> Time
    sig { returns(Time) }
    def at; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def delete; end

    # RDL Type: ([ to_f: () -> XXX ]) -> XXX
    sig { params(at: T.untyped).returns(T.untyped) }
    def reschedule(at); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def add_to_queue; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def retry; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def kill; end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def error?; end

    # RDL Type: () {(XXX) -> (nil or true)} -> XXX
    sig { returns(T.untyped) }
    def remove_job; end
  end

  class SortedSet
    # RDL Type: (String) -> self
    sig { params(name: String).returns(T.self_type) }
    def initialize(name); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def size; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def clear; end
  end

  class JobSet
    # RDL Type: ([ to_f: () -> XXX ], XXX) -> XXX
    sig { params(timestamp: T.untyped, message: T.untyped).returns(T.untyped) }
    def schedule(timestamp, message); end

    # RDL Type: () {(Sidekiq::SortedEntry) -> XXX} -> XXX
    sig { returns(T.untyped) }
    def each; end

    # RDL Type: ((Array or Enumerator::ArithmeticSequence or Rake::FileList or Range), ?Number) -> XXX
    sig { params(score: T.any(Range, Array, Rake::FileList, Enumerator::ArithmeticSequence), jid: Integer).returns(T.untyped) }
    def fetch(score, jid = nil); end

    # RDL Type: (Number) -> Sidekiq::SortedEntry
    sig { params(jid: Integer).returns(Sidekiq::SortedEntry) }
    def find_job(jid); end

    # RDL Type: (String, XXX) -> XXX
    sig { params(name: String, value: T.untyped).returns(T.untyped) }
    def delete_by_value(name, value); end
  end

  class ScheduledSet
    # RDL Type: () -> self
    sig { returns(T.self_type) }
    def initialize; end
  end

  class RetrySet
    # RDL Type: () -> self
    sig { returns(T.self_type) }
    def initialize; end
  end

  class DeadSet
    # RDL Type: () -> self
    sig { returns(T.self_type) }
    def initialize; end

    # RDL Type: (XXX, ?[ []: (:notify_failure) -> XXX ]) -> true
    sig { params(message: T.untyped, opts: T.untyped).returns(TrueClass) }
    def kill(message, opts = nil); end
  end

  class ProcessSet
    # RDL Type: (?XXX) -> self
    sig { params(clean_plz: T.untyped).returns(T.self_type) }
    def initialize(clean_plz = nil); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def cleanup; end

    # RDL Type: () {(Sidekiq::Process) -> XXX} -> XXX
    sig { returns(T.untyped) }
    def each; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def size; end

    # RDL Type: () -> String
    sig { returns(String) }
    def leader; end
  end

  class Process
    # RDL Type: ([ []: (XXX) -> XXX ]) -> self
    sig { params(hash: T.untyped).returns(T.self_type) }
    def initialize(hash); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def tag; end

    # RDL Type: () -> Array<t>
    sig { returns(T::Array[T.untyped]) }
    def labels; end

    # RDL Type: (XXX) -> XXX
    sig { params(key: T.untyped).returns(T.untyped) }
    def [](key); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def identity; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def quiet!; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def stop!; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def dump_threads; end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def stopping?; end

    # RDL Type: (XXX) -> XXX
    sig { params(sig: T.untyped).returns(T.untyped) }
    def signal(sig); end
  end

  class Workers
    # RDL Type: () {(XXX, Number, XXX) -> XXX} -> XXX
    sig { returns(T.untyped) }
    def each; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def size; end
  end

  class CLI
    # RDL Type: (?XXX) -> [:concurrency, :timeout]
    sig { params(args: T.untyped).returns(T::Array[Symbol]) }
    def parse(args = nil); end

    # RDL Type: () -> String
    sig { returns(String) }
    def jruby?; end

    # RDL Type: (IO) -> XXX
    sig { params(self_read: IO).returns(T.untyped) }
    def launch(self_read); end

    # RDL Type: (XXX) -> XXX
    sig { params(sig: T.untyped).returns(T.untyped) }
    def handle_signal(sig); end

    # RDL Type: () -> nil
    sig { void }
    def print_banner; end

    # RDL Type: (String) -> String
    sig { params(cli_env: String).returns(String) }
    def set_environment(cli_env); end

    # RDL Type: (([ []: ((XXX or XXX)) -> XXX ] and [ []=: ((XXX or XXX), XXX) -> XXX ] and [ delete: (XXX) -> XXX ] and [ keys: () -> XXX ])) -> XXX
    sig { params(hash: T.untyped).returns(T.untyped) }
    def symbolize_keys_deep!(hash); end

    # RDL Type: (XXX) -> XXX
    sig { params(args: T.untyped).returns(T.untyped) }
    def setup_options(args); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def options; end

    # RDL Type: () -> [:concurrency, :timeout]
    sig { returns(T::Array[Symbol]) }
    def validate!; end

    # RDL Type: (XXX) -> Hash<(:concurrency or :config_file or :environment or :queues or :require or :strict or :tag or :timeout or :verbose), (Array<XXX> or Number or String or false or true)>
    sig { params(argv: T.untyped).returns(T::Hash[Symbol, T.any(T::Array[T.untyped], FalseClass, TrueClass, String, Integer)]) }
    def parse_options(argv); end

    # RDL Type: (([ []: (:queues) -> XXX ] and [ []=: (:concurrency, Number) -> XXX ] and [ []=: (:config_file, XXX) -> XXX ] and [ []=: (:environment, XXX) -> XXX ] and [ []=: (:queues, Array<XXX>) -> XXX ] and [ []=: (:require, XXX) -> XXX ] and [ []=: (:strict, false) -> XXX ] and [ []=: (:tag, XXX) -> XXX ] and [ []=: (:timeout, Number) -> XXX ] and [ []=: (:verbose, XXX) -> XXX ])) -> OptionParser
    sig { params(opts: T.untyped).returns(OptionParser) }
    def option_parser(opts); end

    # RDL Type: () -> nil
    sig { void }
    def initialize_logger; end

    # RDL Type: (([ []: (:queues) -> XXX ] and [ []=: (:queues, Array<XXX>) -> XXX ] and [ []=: (:strict, false) -> XXX ]), XXX, ?[ to_i: () -> Number ]) -> nil
    sig { params(opts: T.untyped, queue: T.untyped, weight: T.untyped).void }
    def parse_queue(opts, queue, weight = nil); end
  end

  class Client
    # RDL Type: () {((Rake::Task or Sidekiq::Middleware::Chain)) -> XXX} -> (Rake::Task or Sidekiq::Middleware::Chain)
    sig { returns(T.any(Sidekiq::Middleware::Chain, Rake::Task)) }
    def middleware; end

    # RDL Type: (?((XXX or XXX or XXX))) -> self
    sig { params(redis_pool: T.untyped).returns(T.self_type) }
    def initialize(redis_pool = nil); end

    # RDL Type: (([ []: (String) -> XXX ] and [ []=: (String, Number) -> XXX ] and [ []=: (String, String) -> XXX ] and [ delete: (String) -> XXX ] and [ is_a?: (Class) -> XXX ] and [ key?: (String) -> XXX ] and [ merge: (Hash<String, (Number or XXX or XXX)>) -> XXX ])) -> nil
    sig { params(item: T.untyped).void }
    def push(item); end

    # RDL Type: (([ []: (String) -> XXX ] and [ []=: (String, Number) -> XXX ] and [ []=: (String, String) -> XXX ] and [ delete: (String) -> XXX ] and [ is_a?: (Class) -> XXX ] and [ key?: (String) -> XXX ] and [ merge: (Hash<String, (Number or XXX or XXX)>) -> XXX ])) -> Array<XXX>
    sig { params(items: T.untyped).returns(T::Array[T.untyped]) }
    def push_bulk(items); end

    # RDL Type: (([ first: () -> XXX ] and [ map: () {(XXX) -> XXX} -> XXX ])) -> true
    sig { params(payloads: T.untyped).returns(TrueClass) }
    def raw_push(payloads); end

    # RDL Type: (Redis, ([ first: () -> XXX ] and [ map: () {(XXX) -> XXX} -> XXX ])) -> XXX
    sig { params(conn: Redis, payloads: T.untyped).returns(T.untyped) }
    def atomic_push(conn, payloads); end

    # RDL Type: (XXX, [ []: (String) -> XXX ]) -> XXX
    sig { params(worker_class: T.untyped, item: T.untyped).returns(T.untyped) }
    def process_single(worker_class, item); end

    # RDL Type: (([ []: (String) -> XXX ] and [ []=: (String, Number) -> XXX ] and [ []=: (String, String) -> XXX ] and [ delete: (String) -> XXX ] and [ is_a?: (Class) -> XXX ] and [ key?: (String) -> XXX ] and [ merge: (Hash<String, (Number or XXX or XXX)>) -> XXX ])) -> ([ []: (String) -> XXX ] and [ []=: (String, Number) -> XXX ] and [ []=: (String, String) -> XXX ] and [ delete: (String) -> XXX ] and [ is_a?: (Class) -> XXX ] and [ key?: (String) -> XXX ] and [ merge: (Hash<String, (Number or XXX or XXX)>) -> XXX ])
    sig { params(item: T.untyped).returns(T.untyped) }
    def normalize_item(item); end
  end

  module ExceptionHandler
    # RDL Type: ([ backtrace: () -> XXX ], ?XXX) -> XXX
    sig { params(ex: T.untyped, ctx: T.untyped).returns(T.untyped) }
    def handle_exception(ex, ctx = nil); end

    class Logger
      # RDL Type: (([ backtrace: () -> XXX ] and [ message: () -> XXX ]), [ empty?: () -> XXX ]) -> nil
      sig { params(ex: T.untyped, ctx: T.untyped).void }
      def call(ex, ctx); end
    end
  end

  class BasicFetch
    # RDL Type: ({ strict: [ !: () -> XXX ], queues: [ map: () {(XXX) -> XXX} -> XXX ] }) -> self
    sig { params(options: T.untyped).returns(T.self_type) }
    def initialize(options); end

    # RDL Type: () -> nil
    sig { void }
    def retrieve_work; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def queues_cmd; end
  end

  class JobLogger
    # RDL Type: (?Sidekiq::Logger) -> self
    sig { params(logger: Sidekiq::Logger).returns(T.self_type) }
    def initialize(logger = nil); end

    # RDL Type: (XXX, XXX) {() -> XXX} -> XXX
    sig { params(item: T.untyped, queue: T.untyped).returns(T.untyped) }
    def call(item, queue); end

    # RDL Type: ([ []: (String) -> XXX ]) {XXX} -> XXX
    sig { params(job_hash: T.untyped).returns(T.untyped) }
    def prepare(job_hash); end

    # RDL Type: ([ []: (String) -> XXX ]) -> { class: XXX, jid: XXX, bid: XXX, tags: XXX }
    sig { params(job_hash: T.untyped).returns(T.untyped) }
    def job_hash_context(job_hash); end

    # RDL Type: (Number) {XXX} -> XXX
    sig { params(start: Integer).returns(T.untyped) }
    def with_elapsed_time_context(start); end

    # RDL Type: (Number) -> { elapsed: String }
    sig { params(start: Integer).returns(T::Hash[Symbol, String]) }
    def elapsed_time_context(start); end

    # RDL Type: (Number) -> Number
    sig { params(start: Integer).returns(Integer) }
    def elapsed(start); end
  end

  class JobRetry
    # RDL Type: (?XXX) -> self
    sig { params(options: T.untyped).returns(T.self_type) }
    def initialize(options = nil); end

    # RDL Type: (XXX, XXX) {() -> XXX} -> XXX
    sig { params(jobstr: T.untyped, queue: T.untyped).returns(T.untyped) }
    def global(jobstr, queue); end

    # RDL Type: (XXX, XXX, XXX, ([ backtrace: () -> XXX ] and [ message: () -> XXX ])) -> XXX
    sig do
      params(
        worker: T.untyped,
        msg: T.untyped,
        queue: T.untyped,
        exception: T.untyped
      ).returns(T.untyped)
    end
    def attempt_retry(worker, msg, queue, exception); end

    # RDL Type: ([ []: (String) -> XXX ]) -> true
    sig { params(msg: T.untyped).returns(TrueClass) }
    def send_to_morgue(msg); end

    # RDL Type: ([ is_a?: (Class) -> XXX ], [ is_a?: (Class) -> XXX ]) -> [ is_a?: (Class) -> XXX ]
    sig { params(msg_retry: T.untyped, default: T.untyped).returns(T.untyped) }
    def retry_attempts_from(msg_retry, default); end

    # RDL Type: ((Number or OpenSSL::BN)) -> XXX
    sig { params(count: T.any(Integer, OpenSSL::BN)).returns(T.untyped) }
    def seconds_to_delay(count); end

    # RDL Type: (([ cause: () -> XXX ] and [ object_id: () -> XXX ]), ?([ <<: (XXX) -> XXX ] and [ include?: (XXX) -> XXX ])) -> false
    sig { params(e: T.untyped, checked_causes: T.untyped).returns(FalseClass) }
    def exception_caused_by_shutdown?(e, checked_causes = nil); end

    # RDL Type: ([ message: () -> XXX ]) -> String
    sig { params(exception: T.untyped).returns(String) }
    def exception_message(exception); end

    # RDL Type: (XXX) -> String
    sig { params(backtrace: T.untyped).returns(String) }
    def compress_backtrace(backtrace); end
  end

  class Launcher
    # RDL Type: (XXX) -> self
    sig { params(options: T.untyped).returns(T.self_type) }
    def initialize(options); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def run; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def quiet; end

    # RDL Type: () -> nil
    sig { void }
    def stop; end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def stopping?; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def start_heartbeat; end

    # RDL Type: () -> nil
    sig { void }
    def clear_heartbeat; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def heartbeat; end

    # RDL Type: () -> Hash<String, (Number or String or XXX or XXX or XXX or XXX)>
    sig { returns(T::Hash[String, T.untyped]) }
    def to_data; end

    # RDL Type: () -> (XXX or XXX)
    sig { returns(T.untyped) }
    def to_json; end
  end

  module LoggingUtils
    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def debug?; end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def info?; end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def warn?; end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def error?; end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def fatal?; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def local_level; end

    # RDL Type: ([ inspect: () -> XXX ]) -> XXX
    sig { params(level: T.untyped).returns(T.untyped) }
    def local_level=(level); end

    # RDL Type: ([ inspect: () -> XXX ]) {() -> XXX} -> XXX
    sig { params(level: T.untyped).returns(T.untyped) }
    def log_at(level); end
  end

  class Logger
    module Formatters
      class Base
        # RDL Type: () -> Number
        sig { returns(Integer) }
        def tid; end

        # RDL Type: () -> XXX
        sig { returns(T.untyped) }
        def ctx; end

        # RDL Type: () -> String
        sig { returns(String) }
        def format_context; end
      end

      class Pretty
        # RDL Type: (XXX, Time, String, XXX) -> String
        sig do
          params(
            severity: T.untyped,
            time: Time,
            program_name: String,
            message: T.untyped
          ).returns(String)
        end
        def call(severity, time, program_name, message); end
      end

      class WithoutTimestamp
        # RDL Type: (XXX, XXX, String, XXX) -> String
        sig do
          params(
            severity: T.untyped,
            time: T.untyped,
            program_name: String,
            message: T.untyped
          ).returns(String)
        end
        def call(severity, time, program_name, message); end
      end

      class JSON
        # RDL Type: (XXX, Time, String, XXX) -> XXX
        sig do
          params(
            severity: T.untyped,
            time: Time,
            program_name: String,
            message: T.untyped
          ).returns(T.untyped)
        end
        def call(severity, time, program_name, message); end
      end
    end
  end

  class Manager
    # RDL Type: (?Hash<(:concurrency or :fetch), XXX>) -> self
    sig { params(options: T::Hash[Symbol, T.untyped]).returns(T.self_type) }
    def initialize(options = nil); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def start; end

    # RDL Type: () -> nil
    sig { void }
    def quiet; end

    # RDL Type: ([ -: (Number) -> XXX ]) -> Set<Sidekiq::Processor>
    sig { params(deadline: T.untyped).returns(T::Set[Sidekiq::Processor]) }
    def stop(deadline); end

    # RDL Type: (XXX) -> XXX
    sig { params(processor: T.untyped).returns(T.untyped) }
    def processor_stopped(processor); end

    # RDL Type: (XXX, XXX) -> XXX
    sig { params(processor: T.untyped, reason: T.untyped).returns(T.untyped) }
    def processor_died(processor, reason); end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def stopped?; end

    # RDL Type: () -> Set<Sidekiq::Processor>
    sig { returns(T::Set[Sidekiq::Processor]) }
    def hard_shutdown; end
  end

  class Monitor
    class Status
      # RDL Type: (?((String or Symbol))) -> Object
      sig { params(section: T.any(Symbol, String)).returns(Object) }
      def display(section = nil); end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def all; end

      # RDL Type: () -> nil
      sig { void }
      def version; end

      # RDL Type: () -> nil
      sig { void }
      def overview; end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def processes; end

      # RDL Type: ([ to_s: () -> String ]) -> String
      sig { params(number: T.untyped).returns(String) }
      def delimit(number); end

      # RDL Type: ([ each: () {(XXX) -> XXX} -> XXX ], ?([ []: (:max_length) -> XXX ] and [ []: (:pad) -> XXX ])) -> String
      sig { params(values: T.untyped, opts: T.untyped).returns(String) }
      def split_multiline(values, opts = nil); end

      # RDL Type: ([ []: (String) -> XXX ]) -> String
      sig { params(process: T.untyped).returns(String) }
      def tags_for(process); end

      # RDL Type: (Numeric) -> String
      sig { params(timestamp: Numeric).returns(String) }
      def time_ago(timestamp); end

      # RDL Type: () -> (XXX or XXX)
      sig { returns(T.untyped) }
      def queue_data; end

      # RDL Type: () -> Sidekiq::ProcessSet
      sig { returns(Sidekiq::ProcessSet) }
      def process_set; end

      # RDL Type: () -> Sidekiq::Stats
      sig { returns(Sidekiq::Stats) }
      def stats; end
    end
  end

  module Paginator
    # RDL Type: (XXX, ?([ *: (XXX) -> XXX ] and [ to_i: () -> Number ]), ?XXX, ?{ reverse: XXX }) -> XXX
    sig do
      params(
        key: T.untyped,
        pageidx: T.untyped,
        page_size: T.untyped,
        opts: T.untyped
      ).returns(T.untyped)
    end
    def page(key, pageidx = nil, page_size = nil, opts = nil); end
  end

  class Processor
    # RDL Type: (Sidekiq::Manager) -> self
    sig { params(mgr: Sidekiq::Manager).returns(T.self_type) }
    def initialize(mgr); end

    # RDL Type: (?XXX) -> nil
    sig { params(wait: T.untyped).void }
    def terminate(wait = nil); end

    # RDL Type: (?XXX) -> nil
    sig { params(wait: T.untyped).void }
    def kill(wait = nil); end

    # RDL Type: () -> nil
    sig { void }
    def start; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def run; end

    # RDL Type: () -> nil
    sig { void }
    def process_one; end

    # RDL Type: () -> nil
    sig { void }
    def get_one; end

    # RDL Type: () -> nil
    sig { void }
    def fetch; end

    # RDL Type: ([ backtrace: () -> XXX ]) -> nil
    sig { params(ex: T.untyped).void }
    def handle_fetch_exception(ex); end

    # RDL Type: ([ perform: (*XXX) -> XXX ], XXX) -> XXX
    sig { params(worker: T.untyped, cloned_args: T.untyped).returns(T.untyped) }
    def execute_job(worker, cloned_args); end

    # RDL Type: (XXX, XXX) {() -> XXX} -> XXX
    sig { params(jobstr: T.untyped, queue: T.untyped).returns(T.untyped) }
    def stats(jobstr, queue); end

    # RDL Type: (XXX) -> Object
    sig { params(str: T.untyped).returns(Object) }
    def constantize(str); end

    class Counter
      # RDL Type: () -> self
      sig { returns(T.self_type) }
      def initialize; end

      # RDL Type: (?XXX) -> XXX
      sig { params(amount: T.untyped).returns(T.untyped) }
      def incr(amount = nil); end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def reset; end
    end

    class SharedWorkerState
      # RDL Type: () -> self
      sig { returns(T.self_type) }
      def initialize; end

      # RDL Type: (Number, XXX) -> XXX
      sig { params(tid: Integer, hash: T.untyped).returns(T.untyped) }
      def set(tid, hash); end

      # RDL Type: (Number) -> XXX
      sig { params(tid: Integer).returns(T.untyped) }
      def delete(tid); end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def dup; end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def size; end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def clear; end
    end
  end

  module Scheduled
    class Enq
      # RDL Type: (?XXX, ?[ each: () {(XXX) -> XXX} -> XXX ]) -> XXX
      sig { params(now: T.untyped, sorted_sets: T.untyped).returns(T.untyped) }
      def enqueue_jobs(now = nil, sorted_sets = nil); end
    end

    class Poller
      # RDL Type: () -> self
      sig { returns(T.self_type) }
      def initialize; end

      # RDL Type: () -> nil
      sig { void }
      def terminate; end

      # RDL Type: () -> nil
      sig { void }
      def start; end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def enqueue; end

      # RDL Type: () -> Number
      sig { returns(Integer) }
      def wait; end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def random_poll_interval; end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def poll_interval_average; end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def scaled_poll_interval; end

      # RDL Type: () -> Number
      sig { returns(Integer) }
      def process_count; end

      # RDL Type: () -> nil
      sig { void }
      def initial_wait; end
    end
  end

  module Worker
    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def logger; end

    module ClassMethods
      # RDL Type: ([ perform: (*XXX) -> XXX ], XXX) -> XXX
      sig { params(worker: T.untyped, args: T.untyped).returns(T.untyped) }
      def execute_job(worker, args); end

      # RDL Type: (*XXX) -> XXX
      sig { params(args: T.untyped).returns(T.untyped) }
      def delay(*args); end

      # RDL Type: (*XXX) -> XXX
      sig { params(args: T.untyped).returns(T.untyped) }
      def delay_for(*args); end

      # RDL Type: (*XXX) -> XXX
      sig { params(args: T.untyped).returns(T.untyped) }
      def delay_until(*args); end

      # RDL Type: ([ merge!: (XXX) -> XXX ]) -> Sidekiq::Worker::Setter
      sig { params(options: T.untyped).returns(Sidekiq::Worker::Setter) }
      def set(options); end

      # RDL Type: (*XXX) -> XXX
      sig { params(args: T.untyped).returns(T.untyped) }
      def perform_async(*args); end

      # RDL Type: ([ to_f: () -> XXX ], *XXX) -> XXX
      sig { params(interval: T.untyped, args: T.untyped).returns(T.untyped) }
      def perform_in(interval, *args); end
    end

    class Setter
      # RDL Type: (Sidekiq::Worker::ClassMethods, [ merge!: (XXX) -> XXX ]) -> self
      sig { params(klass: Sidekiq::Worker::ClassMethods, opts: T.untyped).returns(T.self_type) }
      def initialize(klass, opts); end

      # RDL Type: (XXX) -> Sidekiq::Worker::Setter
      sig { params(options: T.untyped).returns(Sidekiq::Worker::Setter) }
      def set(options); end
    end
  end

  module Util
    # RDL Type: (XXX) {() -> XXX} -> XXX
    sig { params(last_words: T.untyped).returns(T.untyped) }
    def watchdog(last_words); end

    # RDL Type: (String) {XXX} -> XXX
    sig { params(name: String).returns(T.untyped) }
    def safe_thread(name); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def logger; end

    # RDL Type: () {XXX} -> XXX
    sig { returns(T.untyped) }
    def redis; end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def tid; end

    # RDL Type: () -> String
    sig { returns(String) }
    def hostname; end

    # RDL Type: () -> (XXX or XXX)
    sig { returns(T.untyped) }
    def process_nonce; end

    # RDL Type: () -> String
    sig { returns(String) }
    def identity; end

    # RDL Type: (XXX, ?([ []: (:reraise) -> XXX ] and [ []: (:reverse) -> XXX ])) -> XXX
    sig { params(event: T.untyped, options: T.untyped).returns(T.untyped) }
    def fire_event(event, options = nil); end
  end

  class Web
    # RDL Type: () -> [s]Sidekiq::Web
    sig { returns(Class) }
    def settings; end

    # RDL Type: (*XXX) -> XXX
    sig { params(middleware_args: T.untyped).returns(T.untyped) }
    def use(*middleware_args); end

    # RDL Type: () -> Array<[Array<XXX>, XXX]>
    sig { returns(T::Array[T::Array[T.untyped]]) }
    def middlewares; end

    # RDL Type: (XXX) -> XXX
    sig { params(env: T.untyped).returns(T.untyped) }
    def call(env); end

    # RDL Type: () -> Sidekiq::Web
    sig { returns(Sidekiq::Web) }
    def app; end

    # RDL Type: (*XXX) -> Array<XXX>
    sig { params(opts: T.untyped).returns(T::Array[T.untyped]) }
    def enable(*opts); end

    # RDL Type: (*XXX) -> Array<XXX>
    sig { params(opts: T.untyped).returns(T::Array[T.untyped]) }
    def disable(*opts); end

    # RDL Type: (XXX, XXX) -> Object
    sig { params(attribute: T.untyped, value: T.untyped).returns(Object) }
    def set(attribute, value); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def sessions; end

    # RDL Type: () -> nil
    sig { void }
    def build_sessions; end
  end

  module Extensions
    module ActionMailer
      # RDL Type: (?XXX) -> Sidekiq::Extensions::Proxy
      sig { params(options: T.untyped).returns(Sidekiq::Extensions::Proxy) }
      def sidekiq_delay(options = nil); end

      # RDL Type: ([ to_f: () -> XXX ], ?[ merge: (Hash<String, Number>) -> XXX ]) -> Sidekiq::Extensions::Proxy
      sig { params(interval: T.untyped, options: T.untyped).returns(Sidekiq::Extensions::Proxy) }
      def sidekiq_delay_for(interval, options = nil); end

      # RDL Type: ([ to_f: () -> XXX ], ?[ merge: (Hash<String, XXX>) -> XXX ]) -> Sidekiq::Extensions::Proxy
      sig { params(timestamp: T.untyped, options: T.untyped).returns(Sidekiq::Extensions::Proxy) }
      def sidekiq_delay_until(timestamp, options = nil); end
    end

    class DelayedModel
      # RDL Type: (String) -> %any
      sig { params(yml: String).returns(T.untyped) }
      def perform(yml); end
    end

    module ActiveRecord
      # RDL Type: (?XXX) -> Sidekiq::Extensions::Proxy
      sig { params(options: T.untyped).returns(Sidekiq::Extensions::Proxy) }
      def sidekiq_delay(options = nil); end

      # RDL Type: ([ to_f: () -> XXX ], ?[ merge: (Hash<String, Number>) -> XXX ]) -> Sidekiq::Extensions::Proxy
      sig { params(interval: T.untyped, options: T.untyped).returns(Sidekiq::Extensions::Proxy) }
      def sidekiq_delay_for(interval, options = nil); end

      # RDL Type: ([ to_f: () -> XXX ], ?[ merge: (Hash<String, XXX>) -> XXX ]) -> Sidekiq::Extensions::Proxy
      sig { params(timestamp: T.untyped, options: T.untyped).returns(Sidekiq::Extensions::Proxy) }
      def sidekiq_delay_until(timestamp, options = nil); end
    end

    class DelayedClass
      # RDL Type: (String) -> %any
      sig { params(yml: String).returns(T.untyped) }
      def perform(yml); end
    end

    module Klass
      # RDL Type: (?XXX) -> Sidekiq::Extensions::Proxy
      sig { params(options: T.untyped).returns(Sidekiq::Extensions::Proxy) }
      def sidekiq_delay(options = nil); end

      # RDL Type: ([ to_f: () -> XXX ], ?[ merge: (Hash<String, Number>) -> XXX ]) -> Sidekiq::Extensions::Proxy
      sig { params(interval: T.untyped, options: T.untyped).returns(Sidekiq::Extensions::Proxy) }
      def sidekiq_delay_for(interval, options = nil); end

      # RDL Type: ([ to_f: () -> XXX ], ?[ merge: (Hash<String, XXX>) -> XXX ]) -> Sidekiq::Extensions::Proxy
      sig { params(timestamp: T.untyped, options: T.untyped).returns(Sidekiq::Extensions::Proxy) }
      def sidekiq_delay_until(timestamp, options = nil); end
    end
  end

  module Middleware
    class Chain
      # RDL Type: ([ instance_variable_set: (:@entries, XXX) -> XXX ]) -> XXX
      sig { params(copy: T.untyped).returns(T.untyped) }
      def initialize_copy(copy); end

      # RDL Type: () {XXX} -> XXX
      sig { returns(T.untyped) }
      def each; end

      # RDL Type: () {(Sidekiq::Middleware::Chain) -> XXX} -> self
      sig { returns(T.self_type) }
      def initialize; end

      # RDL Type: () -> Array<Sidekiq::Middleware::Entry>
      sig { returns(T::Array[Sidekiq::Middleware::Entry]) }
      def entries; end

      # RDL Type: (XXX) -> XXX
      sig { params(klass: T.untyped).returns(T.untyped) }
      def remove(klass); end

      # RDL Type: ([ new: (*XXX) -> XXX ], *XXX) -> XXX
      sig { params(klass: T.untyped, args: T.untyped).returns(T.untyped) }
      def add(klass, *args); end

      # RDL Type: ([ new: (*XXX) -> XXX ], *XXX) -> XXX
      sig { params(klass: T.untyped, args: T.untyped).returns(T.untyped) }
      def prepend(klass, *args); end

      # RDL Type: (XXX, [ new: (*XXX) -> XXX ], *XXX) -> XXX
      sig { params(oldklass: T.untyped, newklass: T.untyped, args: T.untyped).returns(T.untyped) }
      def insert_before(oldklass, newklass, *args); end

      # RDL Type: (XXX, [ new: (*XXX) -> XXX ], *XXX) -> XXX
      sig { params(oldklass: T.untyped, newklass: T.untyped, args: T.untyped).returns(T.untyped) }
      def insert_after(oldklass, newklass, *args); end

      # RDL Type: (XXX) -> (false or true)
      sig { params(klass: T.untyped).returns(T.any(FalseClass, TrueClass)) }
      def exists?(klass); end

      # RDL Type: () -> (false or true)
      sig { returns(T.any(FalseClass, TrueClass)) }
      def empty?; end

      # RDL Type: () -> Enumerator<t>
      sig { returns(T::Enumerator[T.untyped]) }
      def retrieve; end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def clear; end
    end

    class Entry
      # RDL Type: ([ new: (*XXX) -> XXX ], *XXX) -> self
      sig { params(klass: T.untyped, args: T.untyped).returns(T.self_type) }
      def initialize(klass, *args); end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def make_new; end
    end

    module I18n
      class Client
        # RDL Type: (XXX, ([ []: (String) -> XXX ] and [ []=: (String, XXX) -> XXX ]), XXX, XXX) {() -> XXX} -> XXX
        sig do
          params(
            _worker: T.untyped,
            msg: T.untyped,
            _queue: T.untyped,
            _redis: T.untyped
          ).returns(T.untyped)
        end
        def call(_worker, msg, _queue, _redis); end
      end

      class Server
        # RDL Type: (XXX, [ fetch: (String, XXX) -> XXX ], XXX) {XXX} -> XXX
        sig { params(_worker: T.untyped, msg: T.untyped, _queue: T.untyped).returns(T.untyped) }
        def call(_worker, msg, _queue); end
      end
    end
  end

  class WebAction
    # RDL Type: () -> [s]Sidekiq::Web
    sig { returns(Class) }
    def settings; end

    # RDL Type: () -> Rack::Request
    sig { returns(Rack::Request) }
    def request; end

    # RDL Type: (XXX) -> XXX
    sig { params(res: T.untyped).returns(T.untyped) }
    def halt(res); end

    # RDL Type: (XXX) -> XXX
    sig { params(location: T.untyped).returns(T.untyped) }
    def redirect(location); end

    # RDL Type: () -> Hash<%any, %any>
    sig { returns(T::Hash[T.untyped, T.untyped]) }
    def params; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def route_params; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def session; end

    # RDL Type: ([ is_a?: (Class) -> XXX ], ?[ []: (:locals) -> XXX ]) -> Object
    sig { params(content: T.untyped, options: T.untyped).returns(Object) }
    def erb(content, options = nil); end

    # RDL Type: ([ !=: (:erb) -> XXX ], [ is_a?: (Class) -> XXX ], ?[ []: (:locals) -> XXX ]) -> Object
    sig { params(engine: T.untyped, content: T.untyped, options: T.untyped).returns(Object) }
    def render(engine, content, options = nil); end

    # RDL Type: (XXX) -> [Number, Hash<String, String>, [XXX]]
    sig { params(payload: T.untyped).returns(T::Array[T.any(T::Array[T.untyped], Integer, T::Hash[String, String])]) }
    def json(payload); end

    # RDL Type: (([ []: (String) -> XXX ] and [ []=: (String, XXX) -> XXX ]), XXX) -> self
    sig { params(env: T.untyped, block: T.untyped).returns(T.self_type) }
    def initialize(env, block); end

    # RDL Type: ([ is_a?: (Class) -> XXX ], [ each: () {(XXX, XXX) -> XXX} -> XXX ]) -> Object
    sig { params(file: T.untyped, locals: T.untyped).returns(Object) }
    def _erb(file, locals); end
  end

  class WebApplication
    # RDL Type: ((Sidekiq::Web or Sidekiq::WebAction or Sidekiq::WebApplication)) -> self
    sig { params(klass: T.any(Sidekiq::WebAction, Sidekiq::WebApplication, Sidekiq::Web)).returns(T.self_type) }
    def initialize(klass); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def settings; end

    # RDL Type: (([ []: (String) -> XXX ] and [ []=: (String, XXX) -> XXX ])) -> Array<(Array<String> or Hash<String, String> or Number)>
    sig { params(env: T.untyped).returns(T::Array[T.any(Integer, T::Array[String], T::Hash[String, String])]) }
    def call(env); end
  end

  module WebRouter
    # RDL Type: (XXX) {XXX} -> nil
    sig { params(path: T.untyped).void }
    def get(path); end

    # RDL Type: (XXX) {XXX} -> nil
    sig { params(path: T.untyped).void }
    def post(path); end

    # RDL Type: (XXX) {XXX} -> nil
    sig { params(path: T.untyped).void }
    def put(path); end

    # RDL Type: (XXX) {XXX} -> nil
    sig { params(path: T.untyped).void }
    def patch(path); end

    # RDL Type: (XXX) {XXX} -> nil
    sig { params(path: T.untyped).void }
    def delete(path); end

    # RDL Type: ([ ==: (String) -> XXX ], XXX) {XXX} -> nil
    sig { params(method: T.untyped, path: T.untyped).void }
    def route(method, path); end

    # RDL Type: (([ []: (String) -> XXX ] and [ []=: (String, XXX) -> XXX ])) -> Sidekiq::WebAction
    sig { params(env: T.untyped).returns(Sidekiq::WebAction) }
    def match(env); end
  end

  class WebRoute
    # RDL Type: ([ ==: (String) -> XXX ], XXX, XXX) -> self
    sig { params(request_method: T.untyped, pattern: T.untyped, block: T.untyped).returns(T.self_type) }
    def initialize(request_method, pattern, block); end

    # RDL Type: () -> Regexp
    sig { returns(Regexp) }
    def matcher; end

    # RDL Type: () -> Regexp
    sig { returns(Regexp) }
    def compile; end

    # RDL Type: (XXX, ([ ==: (XXX) -> XXX ] and [ match: (XXX) -> XXX ])) -> (Hash or Hash<XXX, XXX>)
    sig { params(request_method: T.untyped, path: T.untyped).returns(T.any(Hash, T::Hash[T.untyped, T.untyped])) }
    def match(request_method, path); end
  end
end

class [s]Sidekiq
  class Queue
    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def all; end
  end

  class DeadSet
    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def max_jobs; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def timeout; end
  end

  class CLI
    # RDL Type: () -> String
    sig { returns(String) }
    def w; end

    # RDL Type: () -> String
    sig { returns(String) }
    def r; end

    # RDL Type: () -> String
    sig { returns(String) }
    def b; end

    # RDL Type: () -> String
    sig { returns(String) }
    def reset; end

    # RDL Type: () -> String
    sig { returns(String) }
    def banner; end
  end

  class Client
    # RDL Type: ([ nil?: () -> XXX ]) {() -> XXX} -> XXX
    sig { params(pool: T.untyped).returns(T.untyped) }
    def via(pool); end

    # RDL Type: (([ []: (String) -> XXX ] and [ []=: (String, Number) -> XXX ] and [ []=: (String, String) -> XXX ] and [ delete: (String) -> XXX ] and [ is_a?: (Class) -> XXX ] and [ key?: (String) -> XXX ] and [ merge: (Hash<String, (Number or XXX or XXX)>) -> XXX ])) -> nil
    sig { params(item: T.untyped).void }
    def push(item); end

    # RDL Type: (([ []: (String) -> XXX ] and [ []=: (String, Number) -> XXX ] and [ []=: (String, String) -> XXX ] and [ delete: (String) -> XXX ] and [ is_a?: (Class) -> XXX ] and [ key?: (String) -> XXX ] and [ merge: (Hash<String, (Number or XXX or XXX)>) -> XXX ])) -> Array<XXX>
    sig { params(items: T.untyped).returns(T::Array[T.untyped]) }
    def push_bulk(items); end

    # RDL Type: (XXX, (Sidekiq::Worker::ClassMethods or Sidekiq::Worker::Setter), *XXX) -> XXX
    sig { params(interval: T.untyped, klass: T.any(Sidekiq::Worker::Setter, Sidekiq::Worker::ClassMethods), args: T.untyped).returns(T.untyped) }
    def enqueue_in(interval, klass, *args); end
  end

  class BasicFetch
    # RDL Type: (([ each: () {(XXX) -> XXX} -> XXX ] and [ empty?: () -> XXX ] and [ size: () -> XXX ]), XXX) -> nil
    sig { params(inprogress: T.untyped, options: T.untyped).void }
    def bulk_requeue(inprogress, options); end
  end

  class Context
    # RDL Type: ([ each_key: () {(XXX) -> XXX} -> XXX ]) {() -> XXX} -> XXX
    sig { params(hash: T.untyped).returns(T.untyped) }
    def with(hash); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def current; end
  end

  class RedisConnection
    # RDL Type: (?([ []: (:pool_timeout) -> XXX ] and [ []: (:size) -> XXX ] and [ []: (:url) -> XXX ] and [ []=: (XXX, XXX) -> XXX ] and [ delete: (XXX) -> XXX ] and [ dup: () -> XXX ] and [ key?: (:id) -> XXX ] and [ keys: () -> XXX ])) -> ConnectionPool
    sig { params(options: T.untyped).returns(ConnectionPool) }
    def create(options = nil); end

    # RDL Type: ([ <: (XXX) -> XXX ], [ +: (Number) -> XXX ]) -> nil
    sig { params(size: T.untyped, concurrency: T.untyped).void }
    def verify_sizing(size, concurrency); end

    # RDL Type: ([ dup: () -> XXX ]) -> XXX
    sig { params(options: T.untyped).returns(T.untyped) }
    def client_opts(options); end

    # RDL Type: ([ dup: () -> XXX ]) -> XXX
    sig { params(options: T.untyped).returns(T.untyped) }
    def log_info(options); end

    # RDL Type: () -> String
    sig { returns(String) }
    def determine_redis_provider; end
  end

  class Testing
    # RDL Type: (XXX) {() -> XXX} -> XXX
    sig { params(mode: T.untyped).returns(T.untyped) }
    def __set_test_mode(mode); end

    # RDL Type: () {XXX} -> XXX
    sig { returns(T.untyped) }
    def disable!; end

    # RDL Type: () {XXX} -> XXX
    sig { returns(T.untyped) }
    def fake!; end

    # RDL Type: () {XXX} -> XXX
    sig { returns(T.untyped) }
    def inline!; end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def enabled?; end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def disabled?; end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def fake?; end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def inline?; end

    # RDL Type: () {(Sidekiq::Middleware::Chain) -> XXX} -> Sidekiq::Middleware::Chain
    sig { returns(Sidekiq::Middleware::Chain) }
    def server_middleware; end

    # RDL Type: ([ split: (String) -> XXX ]) -> XXX
    sig { params(str: T.untyped).returns(T.untyped) }
    def constantize(str); end
  end

  class Queues
    # RDL Type: (XXX) -> XXX
    sig { params(queue: T.untyped).returns(T.untyped) }
    def [](queue); end

    # RDL Type: (XXX, XXX, XXX) -> XXX
    sig { params(queue: T.untyped, klass: T.untyped, job: T.untyped).returns(T.untyped) }
    def push(queue, klass, job); end

    # RDL Type: () -> Hash<String, Array<Sidekiq::Job>>
    sig { returns(T::Hash[String, T::Array[Sidekiq::Job]]) }
    def jobs_by_queue; end

    # RDL Type: () -> Hash<String, Array<Sidekiq::Job>>
    sig { returns(T::Hash[String, T::Array[Sidekiq::Job]]) }
    def jobs_by_worker; end

    # RDL Type: (Number, [ to_s: () -> String ], XXX) -> XXX
    sig { params(jid: Integer, queue: T.untyped, klass: T.untyped).returns(T.untyped) }
    def delete_for(jid, queue, klass); end

    # RDL Type: (XXX, XXX) -> XXX
    sig { params(queue: T.untyped, klass: T.untyped).returns(T.untyped) }
    def clear_for(queue, klass); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def clear_all; end
  end

  class Worker
    # RDL Type: () -> Array<Sidekiq::Job>
    sig { returns(T::Array[Sidekiq::Job]) }
    def jobs; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def clear_all; end

    # RDL Type: () -> nil
    sig { void }
    def drain_all; end

    # RDL Type: (Module) -> XXX
    sig { params(base: Module).returns(T.untyped) }
    def included(base); end
  end

  class Web
    # RDL Type: () -> [s]Sidekiq::Web
    sig { returns(Class) }
    def settings; end

    # RDL Type: () -> Array<[Array<XXX>, XXX]>
    sig { returns(T::Array[T::Array[T::Array[T.untyped]]]) }
    def middlewares; end

    # RDL Type: (*XXX) -> XXX
    sig { params(middleware_args: T.untyped).returns(T.untyped) }
    def use(*middleware_args); end

    # RDL Type: () -> { String: String }
    sig { returns(T::Hash[Symbol, String]) }
    def default_tabs; end

    # RDL Type: () -> Hash<XXX, XXX>
    sig { returns(T::Hash[T.untyped, T.untyped]) }
    def custom_tabs; end

    # RDL Type: () -> [String]
    sig { returns(T::Array[String]) }
    def locales; end

    # RDL Type: () -> String
    sig { returns(String) }
    def views; end

    # RDL Type: (*XXX) -> Array<XXX>
    sig { params(opts: T.untyped).returns(T::Array[T.untyped]) }
    def enable(*opts); end

    # RDL Type: (*XXX) -> Array<XXX>
    sig { params(opts: T.untyped).returns(T::Array[T.untyped]) }
    def disable(*opts); end

    # RDL Type: (XXX, XXX) -> Object
    sig { params(attribute: T.untyped, value: T.untyped).returns(Object) }
    def set(attribute, value); end

    # RDL Type: (XXX) -> XXX
    sig { params(env: T.untyped).returns(T.untyped) }
    def call(env); end
  end

  class WebApplication
    # RDL Type: () -> [s]Sidekiq::Web
    sig { returns(Class) }
    def settings; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def tabs; end

    # RDL Type: (XXX, XXX) -> nil
    sig { params(key: T.untyped, val: T.untyped).void }
    def set(key, val); end

    # RDL Type: (?XXX) {XXX} -> XXX
    sig { params(mod: T.untyped).returns(T.untyped) }
    def helpers(mod = nil); end

    # RDL Type: (?((Rake::FileList or String))) -> XXX
    sig { params(path: T.any(String, Rake::FileList)).returns(T.untyped) }
    def before(path = nil); end

    # RDL Type: (?((Rake::FileList or String))) -> XXX
    sig { params(path: T.any(String, Rake::FileList)).returns(T.untyped) }
    def after(path = nil); end

    # RDL Type: (XXX, XXX) -> XXX
    sig { params(app: T.untyped, action: T.untyped).returns(T.untyped) }
    def run_befores(app, action); end

    # RDL Type: (XXX, XXX) -> XXX
    sig { params(app: T.untyped, action: T.untyped).returns(T.untyped) }
    def run_afters(app, action); end

    # RDL Type: () -> Array<[(Regexp or XXX), XXX]>
    sig { returns(T::Array[T::Array[Regexp]]) }
    def befores; end

    # RDL Type: () -> Array<[(Regexp or XXX), XXX]>
    sig { returns(T::Array[T::Array[Regexp]]) }
    def afters; end
  end
end
