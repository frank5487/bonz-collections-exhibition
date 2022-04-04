package en.upenn.service;

public interface FavoriteService {
    boolean isFavorite(int mid, int uid);

    void add(int mid, int uid);
}
