Given(/the following tasks in the database/) do |task_table|
    task_table.hashes.each do |task|
        Task.create(task)
        # each returned element will be a hash whose key is the table header.
        # you should arrange to add that movie to the database here.
    end
  end

  When(/I go on the tasks page/) do
    visit tasks_path
  end

  Then /"(.*)" should appear before "(.*)"/ do |a, b|
    page.body.should =~ /#{a}.*#{b}/m
  end

  Then /"(.*)" should be the priority for "(.*)"/ do |priority, task_name|
    card = find('div', id: 'task-card-'+task_name)
    card.should have_selector('h5', text: priority)
  end

  Then /"(.*)" should be the description for "(.*)"/ do |description, task_name|
    card = find('div', id: 'task-card-'+task_name)
    card.should have_selector('small', text: description)
  end

  Then /"(.*)" should be the category for "(.*)"/ do |category, task_name|
    card = find('div', id: 'task-card-'+task_name)
    card.should have_selector('span', text: category)
  end

  Then /"(.*)" should be the user_added for "(.*)"/ do |user_added, task_name|
    card = find('div', id: 'task-card-'+task_name)
    card.should have_selector('small', text: "Posted by "+user_added)
  end

  Then /"(.*)" should be the user_complete for "(.*)"/ do |user_complete, task_name|
    card = find('div', id: 'task-card-'+task_name)
    card.should have_selector('small', text: "Completed by "+user_complete)
  end

  Then /"(.*)" should not say completed/ do |task_name|
    card = find('div', id: 'task-card-'+task_name)
    expect(card).to have_no_css('small.complete')
  end

  Then /the category dropdown should have the correct options/ do 
    page.body.should have_select('task_category', :options => ['Inventory', 'Register', 'Engineering'])
  end

  Then /the category dropdown should have "(.*)" selected/ do |category|
    page.body.should have_select('task_category', selected: category)
  end

  Then /there should be the correct priority options/ do 
    page.body.should have_selector('input', id: "priority_1")
    page.body.should have_selector('input', id: "priority_2")
    page.body.should have_selector('input', id: "priority_3")
  end

  Then /the "(.*)" priority button should be checked/ do |priority|
    if priority == "Low"
        number = 1
    elsif priority == "Medium"
        number = 2
    else 
        number = 3
    end
    add_modal = page.find('div', id: "add-task-modal")
    expect(add_modal.find('input', id: "priority_#{number}")).to be_checked
  end

  When /^(?:|I )enter task name "(.*)"/ do |name|
    name_field = page.find('div', id: "add-task-modal").find('input', id: "task_name")
    name_field.set(name)
  end

  When /^(?:|I )enter task description "(.*)"/ do |description|
    description_field = page.find('div', id: "add-task-modal").find('textarea', id: "task_description")
    description_field.set(description)
  end

  When /^(?:|I )pick "(.*)" from the category dropdown on the add task modal/ do |category|
    page.find('div', id: "add-task-modal").find('option', text: category).select_option
  end

  When /^(?:|I )pick "(.*)" as the priority on the add task modal/ do |priority|
    if priority == "Low"
        number = 1
    elsif priority == "Medium"
        number = 2
    else 
        number = 3
    end
    page.find('div', id: "add-task-modal").find('input', id: "priority_#{number}").choose()
  end

  When /^(?:|I )add the task/ do
    page.find('#submit-add-task').click()
  end

  When /^(?:|I )(?:un)*check-off "(.*)"/ do |task_name| 
    panel = find('div', id: 'task-panel-'+task_name)
    panel.find('picture').click()
  end

  When /^(?:|I )confirm "(.*)" for the task with id "(.*)"/ do |action, id|
    if  action == "Undo Task Completion"
        modal = find('div', id: "confirm-toggle-modal-#{id}")
        modal.find_button('Undo Task Completion').click()
    elsif action == "Complete Task"
        modal = find('div', id: "confirm-toggle-modal-#{id}")
        modal.find_button('Complete Task').click()
    elsif action == "Edit Task"
        modal = find('div', id: "edit-task-moda-l#{id}")
        modal.find_button('Edit Task').click()
    else #this would be the delete task case
        modal = find('div', id: "edit-task-modal-#{id}")
        modal.find_button('Delete Task').click()
    end
    
  end
