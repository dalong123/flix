class Show < ActiveRecord::Base
  def self.filter(params)
    query = Show.unscoped
    genres = params[:genre]
    filter_by_genres = []

    if genres[:thrillers]
      filter_by_genres << 'Thrillers'
    end

    if genres[:tv]
      filter_by_genres << 'TV Shows'
    end

    if genres[:special_interest]
      filter_by_genres << 'Special Interest'
    end

    if genres[:scifi]
      filter_by_genres << 'Sci-Fi &amp; Fantasy'
    end

    if genres[:romantic]
      filter_by_genres << 'Romantic Movies'
    end

    if genres[:music]
      filter_by_genres << 'Music'
    end

    if genres[:independent]
      filter_by_genres << 'Independent Movies'
    end

    if genres[:horror]
      filter_by_genres << 'Horror Movies'
      filter_by_genres << 'Horror'
    end

    if genres[:gay]
      filter_by_genres << 'Gay &amp; Lesbian Movies'
    end

    if genres[:foreign]
      filter_by_genres << 'Foreign Movies'
    end

    if genres[:faith]
      filter_by_genres << 'Faith &amp; Spirituality'
    end

    if genres[:dramas]
      filter_by_genres << 'Dramas'
    end

    if genres[:documentary]
      filter_by_genres << 'Documentaries'
    end

    if genres[:documentary]
      filter_by_genres << 'Documentaries'
    end
    if genres[:comedy]
      filter_by_genres << 'Comedies'
    end

    if genres[:classic]
      filter_by_genres << 'Classic Movies'
    end

    if genres[:canadian]
      filter_by_genres << 'Canadian Movies'
    end

    if genres[:canadian]
      filter_by_genres << 'Canadian Movies'
    end

    if genres[:children]
      filter_by_genres << 'Children &amp; Family Movies'
    end

    if genres[:anime]
      filter_by_genres << 'Anime'
    end

    if genres[:action]
      filter_by_genres << 'Action &amp; Adventure'
    end

    query = query.where(genre: filter_by_genres)

    if params[:min_release_year]
      query = query.where('year >= ?', params[:min_release_year])
    end

    if params[:min_imdb_rating]
      query = query.where('imdb_rating >= ?', params[:min_imdb_rating])
    end

    if user = params[:user]
      query = query.where('shows.id not in (?)', user.show_ids)
    end

    query
  end
end
