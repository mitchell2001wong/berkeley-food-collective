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
    # page.body.should =~ /#{priority}.*#{task_name}/m
    # regexp = Regexp.new("#{priority}\s*#{task_name}")
    # page.should =~ regexp
    # pri = find('h5', text: priority)

    # task = find('h5', text: task_name)
    card = find('div', id: 'task-card-'+task_name)
    card.should have_selector('h5', text: priority)
    # expect(task).to have_sibling('h5', text: priority, left_of: task)
    # page.should have_selector('h5', text: task_name)
    # page.should have_selector('div', id: 'task-card-'+task_name)
    # page.body.should =~ /task-card-#{task_name}/m

  end