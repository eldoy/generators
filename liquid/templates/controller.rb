#####
# __NAME__
#####


# GET INDEX
get('/__name__s') do
  __name__s = __Name__.order(:created_at => -1)
  haml :'__name__/index', :locals => {:__name__s => __name__s}
end


# GET SHOW
get('/__name__s/:id') do
  __name__ = __Name__.find(params['id'])

  if __name__
    haml :'__name__/show', :locals => {:__name__ => __name__}
  else
    flash[:error] = "__Name__ not found"
    redirect("/__name__s");
  end
end

# GET NEW
get('/__name__s/new') do
  haml :'__name__/new', :locals => {:__name__ => __Name__.new}
end


# POST CREATE
post('/__name__s') do
  __name__ = __Name__.new(params['__name__'])

  if __name__.save
    flash[:info] = "__Name__ successfully created"
    redirect("/__name__s/#{__name__.id}")
  else
    flash.now[:error] = t('flash.correct_errors')
    haml :'__name__/new', :locals => {:__name__ => __name__}
  end
end


# GET EDIT
get('/__name__s/:id/edit') do
  __name__ = __Name__.find(params['id'])
  haml :'__name__/edit', :locals => {:__name__ => __name__}
end


# PUT UPDATE
put('/__name__s/:id') do
  __name__ = __Name__.find(params['id'])

  if __name__.update_attributes params['__name__']
    flash[:info] = "__Name__ updated"
    redirect("/__name__s/#{__name__.id}")
  else
    flash.now[:error] = t('flash.correct_errors')
    haml :'__name__/edit', :locals => {:__name__ => __name__}
  end
end


# GET DELETE
get('/__name__s/:id/delete') do
  __name__ = __Name__.find(params['id'])
  haml :'__name__/delete', :locals => {:__name__ => __name__}
end


# DELETE DELETE
delete('/__name__s/:id') do
  __name__ = __Name__.find(params['id'])

  if __name__.destroy
    flash[:info] = "__Name__ destroyed"
  else
    flash[:error] = "Could not destroy __name__"
  end
  redirect("/__name__s")
end
