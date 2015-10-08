module NdrError
  # Module to help with searching through fingerprints / logs.
  module Finder
    def search(keywords)
      scope = Fingerprint.includes(:error_logs)
      return scope unless keywords && keywords.any?

      # Fetch the collection of fingerprint matches:
      records = scope.filter_by_keywords(keywords).to_a

      # Add to that fingerprints with log records that matched the search:
      log_print_ids = Log.filter_by_keywords(keywords).pluck(:error_fingerprintid)
      records.concat scope.find(log_print_ids)

      order(records)
    end

    private

    # Intelligent search order:
    #
    #   Bring records that have matched multiple times
    #   to the front, but attempt to maintain the
    #   created_at DESC order within groups.
    #
    def order(records)
      grouped = records.group_by { |record| records.count(record) }.each do |_count, group|
        group.sort! do |a, b|
          [b.updated_at, b.error_fingerprintid] <=> [a.updated_at, a.error_fingerprintid]
        end
      end

      grouped.values.flatten.uniq
    end
  end
end