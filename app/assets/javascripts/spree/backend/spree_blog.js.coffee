Spree.routes.tags_search = Spree.pathFor('api/tags')
Spree.routes.posts_search = Spree.pathFor('api/posts')
Spree.routes.categories_search = Spree.pathFor('api/categories')

$ ->
  if $('#post_related_post_ids').length > 0
    $('#post_related_post_ids').select2
      placeholder: 'Related Posts'
      multiple: true
      ajax:
        url: Spree.routes.posts_search
        datatype: 'json'
        data: (term, page) ->
          token: Spree.api_key
          per_page: 50
          page: page
          q:
            title_cont: term
        results: (data, page) ->
          results: data['spree_posts']
      formatResult: (post) -> post.title
      formatSelection: (post) -> post.title
      initSelection: (element, callback) ->
        url = Spree.url Spree.routes.posts_search, ids: element.val()
        $.getJSON url, {token: Spree.api_key}, (data) ->
          callback(data['posts'])

  if $('#post_tag_names').length > 0
    $('#post_tag_names').select2
      tags: true
      tokenSeparators: [","]
      placeholder: 'Tags'
      multiple: true
      ajax:
        url: Spree.routes.tags_search
        datatype: 'json'
        data: (term, page) ->
          token: Spree.api_key
          per_page: 50
          page: page
          q:
            name_cont: term
        results: (data, page) ->
          if typeof data.spree_tags != "undefined" && data.spree_tags?
            results: $.map data.spree_tags, (val, i) ->
              id: val.name
              text: val.name
          else
            results: []
      createSearchChoice: (term, data) ->
        if $(data).filter(->
          this.text.localeCompare(term) == 0).length == 0
          id: term
          text: term
      initSelection : (element, callback) ->
        data = []
        $(element.val().split(",")).each ->
            data.push
              id: this
              text: this
        callback data

  if $('#post_category_ids').length > 0
    $('#post_category_ids').select2
      placeholder: 'Categories'
      multiple: true
      ajax:
        url: Spree.routes.categories_search
        datatype: 'json'
        data: (term, page) ->
          token: Spree.api_key
          per_page: 50
          page: page
          q:
            title_cont: term
        results: (data, page) ->
          results: data['spree_categories']
      formatResult: (category) -> category.name
      formatSelection: (category) -> category.name
      initSelection: (element, callback) ->
        url = Spree.url Spree.routes.categories_search, ids: element.val()
        $.getJSON url, {token: Spree.api_key}, (data) ->
          callback(data['categories'])