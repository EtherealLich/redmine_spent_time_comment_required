module Patches
  module IssuesControllerPatch
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do
        unloadable
        alias_method_chain :update, :check_spent_time_comment
      end
    end

    module ClassMethods
    end
    module InstanceMethods
      def update_with_check_spent_time_comment
        if ((params[:time_entry][:hours] != "") && (params[:time_entry][:comments] == ""))
          flash[:error] = l('spent_time_comment_required')
          find_issue
          update_issue_from_params
          render(:action => 'edit') and return
        else
          update_without_check_spent_time_comment
        end
      end
    end

  end
end

IssuesController.send(:include, Patches::IssuesControllerPatch)