﻿using bacit_dotnet.MVC.Models.Suggestions;

namespace bacit_dotnet.MVC.Repositories
{
    public interface ISuggestionRepository
    {
        void AddSuggestion(SuggestionEntity suggestion);
        List<SuggestionEntity> GetSuggestions();
        List<SuggestionEntity> GetSuggestionsWithSearchQyery(string searchWord);
        void Edit(SuggestionEntity suggestion);

        void Delete(int Suggestion);
        
    }
}
