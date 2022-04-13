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