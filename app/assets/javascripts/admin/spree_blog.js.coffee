$ ->
  'use strict'
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
          per_page: 50
          page: page
          q:
            name_cont: term
        results: (data, page) ->
          if typeof data.tags != "undefined" && data.tags?
            results: $.map data.tags, (val, i) ->
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
